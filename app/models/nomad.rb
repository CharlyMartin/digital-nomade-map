class Nomad < ApplicationRecord
  enum gender: { not_given: 0, female: 1, male: 2 }

  acts_as_token_authenticatable
  devise :database_authenticatable, :validatable, :registerable, :timeoutable, :omniauthable,
  omniauth_providers: [:facebook]

  validates :first_name, :last_name, :latitude, :longitude, presence: true
  validates :username, presence: true, uniqueness: :true
  validates :email, presence: true, uniqueness: :true

  after_validation :geocode, if: :full_address_changed?
  after_validation :reverse_geocode

  before_save :format_name

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

  # Ruby Geocoder methods
  geocoded_by :full_address

  reverse_geocoded_by :latitude, :longitude do |n,results|
    if geo = results.first
      (n.address   = geo.street_number + ", " + geo.route) if (geo.street_number && geo.route)
      (n.city      = geo.city) if geo.city
      (n.zip_code  = geo.postal_code) if geo.postal_code
      (n.country   = geo.country) if geo.country
    end
  end

  def country_name(country_code)
    ISO3166::Country[country_code].name unless country_code.empty?
  end

  def full_address
    [address, zip_code, city, country_name(country)].compact.join(', ')
  end

  def full_address_changed?
    address_changed? || zip_code_changed? || city_changed? || country_changed?
  end

  def puts_coco
    puts "coco"
  end

  def format_name
    self.first_name = self.first_name.capitalize
    self.last_name = self.last_name.upcase
  end
end
