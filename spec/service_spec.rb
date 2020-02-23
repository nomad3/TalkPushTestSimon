require "redis"
require "logger"
require "./src/service"
require "./spec/mocks"

describe Pushtalk::Service do  
  context "when given a mock for its config" do
    before do
      @service = Pushtalk::Service.new Hash.new, RequesterMock.new, RedisMock.new, LoggerMock.new
    end

    it "responds to the basic method calls" do
      expect(@service.respond_to? :get).to be true
      expect(@service.respond_to? :filter).to be true
      expect(@service.respond_to? :push).to be true
    end

    it "works from start to end with the mock" do
      result = @service
               .get
               .filter
               .push

      expect(result).to be_truthy
      expect(@service.list.size).to eq 1
    end
  end
end
