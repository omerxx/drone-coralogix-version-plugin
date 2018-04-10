require "spec"
require "../src/plugin"

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

  it "returns empty if timestamp is not present" do
    param("dctimestamp").empty?.should be_true
  end

  it "raises a key error if the parameter does not exist in the env" do
    expect_raises(KeyError) do
      param("NONEXISTING")
    end
  end
end

describe "Creating a tag: " do
  it "raises an error if one of the class fields that is no timestamp are missing" do 
    expect_raises(PluginException) do
      vtag = VersionTag.new("", "staging", "all", "Omer", Time.now.to_s("%Y-%m-%d:%H:%M:%S"))
      createTag(vtag)
    end
  end
end

describe "Running the Plugin: " do
  it "raises and error if one of the parameters are missing" do 
    expect_raises(KeyError) do
      ["key", "subsystem", "name", "timestamp"].each { |field| ENV[field] = "x" }
      run!
    end
  end
end

