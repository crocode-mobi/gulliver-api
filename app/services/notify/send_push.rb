require 'urbanairship'

class Notify::SendPush

  def initialize
    @ua = Urbanairship
    @client = @ua::Client.new(key: ENV['UA_APP_KEY'], secret: ENV['UA_APP_SECRET'])
  end

  def notify_all
  end

  def notify_devices
    # Send push
    p = @client.create_push
    p.audience = @ua.all
    p.notification = @ua.notification(alert: 'Hello')
    p.device_types = @ua.all
    p.send_push
  end

end
