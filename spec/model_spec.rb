require "json"
require "date"
require "./src/model"

describe Pushtalk::Model do
  context "when given a basic CSV row" do
    before do
      @model = Pushtalk::Model.new "10/12/2019 12:31:45", "John", "Lennon", "jlennon@mail.com", "123"
    end
    
    it "contains the basic data" do
      expect(@model.first_name).to eq "John"
      expect(@model.last_name).to eq "Lennon"
      expect(@model.email).to eq "jlennon@mail.com"
      expect(@model.phone_number).to eq "123"
    end

    it "correctly parses timestamps" do
      expect(@model.timestamp).to eq Date.parse("2019-10-12T12:31:45")
    end

    it "can be converted to a lead" do
      lead = JSON.parse @model.to_lead.to_json

      expect(lead["first_name"]).to eq "John"
      expect(lead["last_name"]).to eq "Lennon"
    end
  end
end
    
