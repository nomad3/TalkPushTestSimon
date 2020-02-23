require "yaml"
require "./src/requester"

describe Pushtalk::Requester do
  context "when given a mock config" do
    before do
      config   = YAML.load File.read "config.yml"
      @request = Pushtalk::Requester.new config
    end

    it "responds to the base methods" do
      expect(@request.respond_to? :get).to be true
      expect(@request.respond_to? :push).to be true
    end

    xit "properly acquires the target Google sheet" do
      expect(@request.get).to eq File.read("./spec/sample.csv")
    end

    xit "correctly sends a given model to Talkpush's API" do
      model = Pushtalk::Model.new "10/12/2019 12:31:45", "John", "Lennon", "jlennon@mail.com", "123"
      
      expect(@request.push model).to be_truthy
    end
  end
end
