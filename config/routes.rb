Rails.application.routes.draw do
  match('/', {:via => :get, :to => 'species#index'})
  match('species', {:via => :get, :to => 'species#index'})
  match('sightings', {:via => :get, :to => 'sightings#index'})
  match('species', {:via => :post, :to => 'species#create'})
  match('species/:id/sightings', {:via => :post, :to => 'sightings#create'})
  match('species/new', {:via => :get, :to => 'species#new'})
  match('species/:id/sightings/new', {:via => :get, :to => 'sightings#new'})
  match('species/:id', {:via => :get, :to => 'species#show'})
  match('species/:id/sightings/:sighting_id', {:via => :get, :to => 'sightings#show'})
  match('species/:id/edit', {:via => :get, :to => 'species#edit'})
  match('species/:id', {:via => [:patch, :put], :to => 'species#update'})
  match('species/:id/sightings/:sighting_id/edit', {:via => :get, :to => 'sightings#edit'})
  match('species/:id/sightings/:sighting_id', {:via => [:patch, :put], :to => 'sightings#update'})
  match('species/:id', {:via => :delete, :to => 'species#destroy'})

end

