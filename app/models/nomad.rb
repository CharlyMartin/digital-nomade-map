class Nomad < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, presence: true
  validates :email, presence: true

  validates :address, presence: true
  # validates :zip_code, presence: true
  validates :city, presence: true
  validates :country, presence: true

  geocoded_by :full_address

  reverse_geocoded_by :latitude, :longitude do |obj,results|
    if geo = results.first
      puts geo.address
      obj.address = geo.address
      obj.city    = geo.city
      obj.zip_code = geo.postal_code
      obj.country = geo.country_code
    end
  end

  after_validation :geocode, if: :full_address_changed?
  after_validation :reverse_geocode


# GEOLOC

  def full_name
    "#{first_name} #{last_name}"
  end

  def city_country
    "#{city}, #{ISO3166::Country[country].name}"
  end

  def full_address
    "#{address}, #{zip_code} #{city} #{ISO3166::Country[country].name}"
  end

  def full_address_changed?
    address_changed? || zip_code_changed? || city_changed? || country_changed?
  end
end
