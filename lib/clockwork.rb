require File.expand_path('../../config/boot',        __FILE__)
require File.expand_path('../../config/environment', __FILE__)
require 'clockwork'

include Clockwork

#every(10.seconds, 'Queuing stocks update') { Delayed::Job.enqueue StocksJob.new, :queue => 'stocking' }
every(20.seconds, 'Queuing Starving population') { Delayed::Job.enqueue StarvationJob.new, :queue => 'starving' }
every(20.seconds, 'Queuing Eating population'){ Delayed::Job.enqueue EatingJob.new, :queue => 'eating' }