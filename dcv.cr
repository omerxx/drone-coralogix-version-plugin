# Drone Coralogix Versioning plugin

require "http/client"

class VersionTag
	@key : 				String
	@application: String
	@subsystem:		String
	@name: 				String
	@timestamp: 	String
	
	getter :key
	getter :application
	getter :subsystem
	getter :name
	getter :timestamp

	setter :key
	setter :application
	setter :subsystem
	setter :name
	setter :timestamp

	def initialize(@key, @application, @subsystem, @name, @timestamp)
	end

end

def param(name)
	return ENV["PLUGIN_#{name.upcase}"]
end

def 

test = VersionTag.new("omer", "222", "something", "somewhere", "awesome")
puts test.key
puts param("omer")




