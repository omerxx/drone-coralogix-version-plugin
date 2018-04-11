require "json"

def secrets_manager
  ENV["PLUGIN_SECRETS_MANAGER"] ||= ""
  sec_manager = ENV["PLUGIN_SECRETS_MANAGER"]

  if !sec_manager.empty?
    output = IO::Memory.new(4096*4)
    Process.run("aws",["secretsmanager", "get-secret-value", "--secret-id", "corkey"], output: output, error: output)
    jsonkey = JSON.parse(output.to_s)["SecretString"]
    ENV["PLUGIN_DCKEY"] = JSON.parse(jsonkey.to_s)["key"].to_s
  else
    puts "Not working with secrets manager"
  end
end
