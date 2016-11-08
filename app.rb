require 'rubygems'
require 'mqtt'

TOPIC = 'BABL'

def publish_message(name , msg)

      # Publish example
      MQTT::Client.connect('10.177.33.144') do |c|
        c.publish(TOPIC, "#{name}: #{msg}")
      end
end

Thread.new do
        # Subscribe example
        MQTT::Client.connect('10.177.33.144') do |c|
          # If you pass a block to the get method, then it will loop
          c.get(TOPIC) do |topic,message|
            puts "#{topic}: #{message}"
          end
        end
end


def get_msg
  puts 'Enter your message : '
  @msg = gets.chomp
end

  puts 'Enter your name : '
  @name = gets.chomp
  get_msg


while @msg != "q" do
    publish_message(@name, @msg)
    get_msg
end
