require 'spec_helper'

describe Sighting do
  it { should validate_presence_of :species_id }
  it { should validate_presence_of :date }
  it { should validate_presence_of :latitude }
  it { should validate_presence_of :longitude }
  it { should validate_presence_of :region_id }
  it { should belong_to :species }

end
