class Sighting < ActiveRecord::Base
  validates :species_id, :presence => true
  validates :date, :presence => true
  validates :latitude, :presence => true
  validates :longitude, :presence => true
  validates :region_id, :presence => true

  belongs_to :species
  belongs_to :region
end
