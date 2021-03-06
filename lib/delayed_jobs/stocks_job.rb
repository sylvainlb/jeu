class StocksJob
  def perform
    zones=Zone.where('next_production_time < ?', Time.now)
    zones.each do |zone|
      zone.produce!
    end
  end
end