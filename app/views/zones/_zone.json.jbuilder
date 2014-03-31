json.(zone, :id, :coordX, :coordY, :population, :productivity, :created_at, :updated_at)
json.stocks @zone.stocks, partial: 'stocks/stock', as: :stock
json.building_type_id @zone.building_type_id
json.building_type @zone.building_type.name
json.resource_type @zone.building_type.resource_type.name
json.resource_type_id @zone.building_type.resource_type_id
