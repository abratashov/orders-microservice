require 'sneakers'
require 'json'

require_relative '../model/shipping'
require_relative '../queue/queue_connection'

Mongoid.load!('mongoid.config', 'development')

class OrderWorker
  include Sneakers::Worker
  from_queue 'orders'

  def work(message)
    if shipment_created?(message)
      puts "#{ @shipping.id } created"
      QueueConnection.publish(@shipment.to_json)
      puts "#{ @shipment } published"
    else
      puts "#{ @shipping } couldn't be created"
    end

    ack!
  end

  def shipment_created?(message)
    @shipment = JSON.parse(message)
    @shipment['status'] = true
    @shipping = Shipping.new(@shipment)
    @shipping.save
  end

end
