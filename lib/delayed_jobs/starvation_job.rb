class StarvationJob
  def perform
    zones=Zone.where('starving_start_time < ?', Time.now)
    zones.each do |zone|
      zone.starve!
    end
  end
end