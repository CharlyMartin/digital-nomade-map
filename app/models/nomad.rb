class Nomad < ApplicationRecord
  devise :database_authenticatable, :registerable, :timeoutable, :omniauthable,
  omniauth_providers: [:facebook]

  validates :first_name, :last_name, :password, :latitude, :longitude, presence: true
  validates :email, presence: true, uniqueness: :true

  # Ruby Geocoder methods
  geocoded_by :full_address
  reverse_geocoded_by :latitude, :longitude

  after_validation :geocode, if: :full_address_changed? # Find out what after validation does
  after_validation :reverse_geocode

  def full_address
    [address, zip_code, city, country_name(country)].compact.join(', ')
  end

  def self.find_for_facebook_oauth(auth)
    nomad_params = auth.slice(:provider, :uid)
    nomad_params.merge! auth.info.slice(:email, :first_name, :last_name)
    nomad_params[:facebook_picture_url] = auth.info.image
    nomad_params[:token] = auth.credentials.token
    nomad_params[:token_expiry] = Time.at(auth.credentials.expires_at)
    nomad_params = nomad_params.to_h

    nomad = Nomad.find_by(provider: auth.provider, uid: auth.uid)
    nomad ||= Nomad.find_by(email: auth.info.email) # Nomad did a regular sign up in the past.
    if nomad
      nomad.update(nomad_params)
    else
      nomad = Nomad.new(nomad_params)
      nomad.password = Devise.friendly_token[0,20]  # Fake password for validation
      nomad.save
    end

    return nomad
  end

  private

  def country_name(country_code)
    ISO3166::Country[country_code].name unless country_code.empty?
  end

  def full_address_changed?
    address_changed? || zip_code_changed? || city_changed? || country_changed?
  end

end
