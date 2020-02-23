require "./src/importer"

describe Pushtalk::Importer do
  context "when given a sample CSV file" do
    before do
      sample_file = File.read "./spec/sample.csv"
      @importer   = Pushtalk::Importer.new sample_file
    end

    it "can correctly parse all entries" do
      model_list  = @importer.parse

      expect(model_list).to be_a(Array)
      expect(model_list.size).to be > 2
      expect(model_list.map(&:email)).to include "jlennon@mail.com"
    end
  end
end
    
