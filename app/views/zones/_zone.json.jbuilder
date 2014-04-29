json.(zone, :id, :coordX, :coordY, :building_type, :next_cycle_time, :next_production_time, :production_start_time, :created_at, :updated_at)
json.output_products zone.output_products
json.set! :stocks do
  zone.stocks.each do |stock|
    json.set! stock.resource_type, stock.nb_resource
  end
end