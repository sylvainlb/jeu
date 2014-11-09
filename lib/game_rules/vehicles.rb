module Vehicles

  VEHICLES = YAML.load_file('lib/game_rules/vehicles.yml')


  def cargo
    VEHICLES[vehicle_type][:cargo]
  end

  def speed
    VEHICLES[vehicle_type][:speed]
  end
end
