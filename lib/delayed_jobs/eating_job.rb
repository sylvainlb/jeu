class EatingJob
  def perform
    zones=Zone.select('zones.*').joins(:stocks).where('stocks.resource_type = ? and stocks.nb_resource > ?','population',0)
    zones.each do |zone|
      zone.population_eat_food!
    end
  end
end