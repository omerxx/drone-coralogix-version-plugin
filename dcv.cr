# Drone Coralogix Versioning plugin

require "http/client"

class PluginException < Exception
end

class VersionTag
	@key :		String
	@application : 	String
	@subsystem :	String
	@name : 	String
	@timestamp : 	String
	
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
	if name.to_s.empty?
		raise PluginException.new("ERROR! - no variable name")
	end
	return ENV["PLUGIN_#{name.upcase}"]
end


def createTag(vtag)
	response = HTTP::Client.get("https://api.coralogix.com/api/v1/addTag?key=#{vtag.key}&application=#{vtag.application}&subsystem=#{vtag.subsystem}&name=#{vtag.name}&timestamp=#{vtag.timestamp}")
	puts response
end


def plugin
	key = 				param("key")
	application = param("application")
	subsystem = 	param("subsystem")
	name = 				param("name")
	timestamp = 	param("timestamp")

end

key = ENV["COR_KEY"]
vtag = VersionTag.new(key, "staging", "all", "Omer", Time.now.to_s("%Y-%m-%d:%H:%M:%S"))
#puts Time.now.to_s("%Y-%m-%d:%H:%M:%S")
#YYYY-MM-DD:HH:mm:ss
#puts test.key
#puts param("omer")
#createTag(vtag)




