require "spec"
require "../dcv"

describe "Parameter func is functional" do
	it "correctly returnes the uppercase PLUGIN_ form" do
		ENV["PLUGIN_TESTME"] = "myplugin"
		param("testme") == "myplugin"
	end
end

