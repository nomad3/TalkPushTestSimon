require "yaml"
require "logger"
require "./src/service"

config  = YAML.parse File.read "config.yml"
service = Pushtalk::Service.new config

service
  .get
  .filter
  .push
