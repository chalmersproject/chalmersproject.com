# frozen_string_literal: true

json.extract!(shelter, :id, :created_at, :updated_at, :name, :slug, :tags)
json.location(RGeo::GeoJSON.encode(shelter.location))
json.extract!(
  shelter,
  :address,
  :contact_email,
  :contact_phone,
  :food_availability,
  :website_url,
)
json.url(shelter_url(shelter, format: :json))
