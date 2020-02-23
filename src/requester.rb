require "json"
require "httparty"

module Pushtalk  
  class Requester
    attr_reader :input, :output

    def initialize(config)
      @input  = config["input"]
      @output = config["output"]
    end

    def get
      resp = HTTParty.get build_url(@input)

      if resp.code == 200
        return resp.body
      else
        raise "HTTP error getting spreadsheet: [#{resp.code}] #{resp.body}"
      end
    end

    def push(elem)
      body = {
        api_key: @output["api_key"],
        campaign_invitation: elem.to_lead
      }
      
      resp = HTTParty.post build_url(@output) + "?api_key=#{@output['api_key']}", body: body.to_json

      if resp.code == 200
        return JSON.parse(resp.body)["id"]
      else
        raise "HTTP error sending to talkpush: [#{resp.code}] #{resp.body}"
      end
    end

    private
    def build_url(hash)
      File.join hash["url"], hash["key"].to_s, hash["route"]
    end
  end
end
