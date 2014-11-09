class TransportJob
  def perform
    fleets=Fleet.where('arrival <= ?', Time.now)
    fleets.each do |fleet|
      fleet.do_actions
    end
  end
end