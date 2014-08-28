class SightingsController < ApplicationController

  def index
    if params[:start_date] != nil
      @sightings = Sighting.by_date(params[:start_date], params[:end_date])
    else

      @sightings = Sighting.all
      render('sightings/index.html.erb')
    end
  end

  def show
    @species = Species.find(params[:id])
    @sighting = Sighting.find(params[:sighting_id])
    render('sightings/show.html.erb')
  end

  def new
    @species = Species.find(params[:id])
    @sighting = Sighting.new
    render('sightings/new.html.erb')
  end

  def create
    @species = Species.find(params[:id])
    @species_id = params[:id]
    @sighting = Sighting.new(species_id: @species_id,
                             latitude: params[:latitude],
                             longitude: params[:longitude],
                             date: params[:date],
                             region_id: params[:region_id])
    if @sighting.save
      render('sightings/success.html.erb')
    else
      render('sightings/new.html.erb')
    end
  end

  def edit
    @sighting = Sighting.find(params[:sighting_id])
    render('sightings/edit.html.erb')
  end

  def update
    @species_id = params[:id]
    @sighting = Sighting.find(params[:sighting_id])
    if @sighting.update(:latitude => params[:latitude],
                         :longitude => params[:longitude],
                         :date => params[:date],
                         :region_id => params[:region_id])
      render('sightings/success.html.erb')
    else
      render('sightings/edit.html.erb')
    end
  end

  def show_all
    @regions = Region.all
    @sightings_for_region = Sighting.where(params[:region_id], params[:value])
    render('sightings/region.html.erb')
  end

  def show_for_region
    @region = Region.find(params[:region_id])
    @sightings_for_region = Sighting.where(:region_id => params[:region_id])
    render('regions/show.html.erb')

  end

  def date_range
    render ('sightings/dates.html.erb')
  end

  def destroy
    @sighting = Sighting.find(params[:sighting_id])
    @sighting.destroy
    render('sightings/destroy.html.erb')
  end
end
