json.(zone, :id, :coordX, :coordY, :next_cycle_time, :next_production_time, :production_start_time, :created_at, :updated_at)
json.building_type_id zone.building_type_id
json.building_type zone.building_type.name
json.resource_type zone.building_type.resource_type.name
json.resource_type_id zone.building_type.resource_type_id
json.set! :stocks do
  zone.stocks.each do |stock|
    json.set! stock.resource_type.name, stock.nb_resource
  end
end