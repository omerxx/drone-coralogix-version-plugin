require "spec"
require "../dcv"

describe "Parameter function is functional: " do
	it "correctly returnes the uppercase PLUGIN_ form" do
		ENV["PLUGIN_TESTME"] = "myplugin"
		param("testme") == "myplugin"
	end

	it "raises an error if it gets an empty variable" do
		expect_raises(PluginException) do
			param("")
		end
	end

	it "raises an error if the parameter does not exist in the env" do
		expect_raises(PluginException) do
			param("NONEXISTING")
		end
	end


#	it "raises an error if one of the class fields are missing" do 
#		expect_raises(Exception) do
#			vtag = VersionTag.new(key, "staging", "all", "Omer", Time.now.to_s("%Y-%m-%d:%H:%M:%S"))
#			versionTag = 
#			createTag(versionTag)



end

