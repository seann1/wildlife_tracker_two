class CreateSightings < ActiveRecord::Migration
  def change
    create_table :sightings do |t|
      t.column :species_id, :integer
      t.column :latitude, :decimal, {:precision => 8, :scale => 6}
      t.column :longitude, :decimal, {:precision => 8, :scale => 6}
      t.column :date, :date
      t.column :region_id, :integer
    end
  end
end
