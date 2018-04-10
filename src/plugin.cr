# Drone Coralogix Versioning plugin

require "http/client"

class PluginException < Exception
end

class VersionTag
  @key :    String
  @application :  String
  @subsystem :  String
  @name :   String
  @timestamp :  String
  
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

	unless name == "timestamp"
		return ENV["PLUGIN_#{name.upcase}"]
	else
		begin
			return ENV["PLUGIN_#{name.upcase}"]
		rescue
			return ""
		end
	end
end


def createTag(vtag)
  if vtag.key.empty? || vtag.application.empty? || vtag.subsystem.empty? || vtag.name.empty?
    raise PluginException.new("One of the parameters are empty")
  end

	if vtag.timestamp.empty?
		vtag.timestamp = Time.now.to_s("%Y-%m-%d:%H:%M:%S")
	end
	puts vtag

	response = HTTP::Client.get("https://api.coralogix.com/api/v1/addTag?key=#{vtag.key}&application=#{vtag.application}&subsystem=#{vtag.subsystem}&name=#{vtag.name}&timestamp=#{vtag.timestamp}")

  puts response.body
end


def run!
  key = param("key")
  application = param("application")
  subsystem =   param("subsystem")
  name =        param("name")
  timestamp =   param("timestamp")

	return createTag(VersionTag.new(key, application, subsystem, name, timestamp))
end

