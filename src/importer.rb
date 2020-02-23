require "csv"

module Pushtalk
  class Importer
    attr_reader :list
    
    def initialize(file)
      @list = CSV.parse file
    end

    def parse
      @list.drop(1).map do |row|
        Model.new *row
      end
    end
  end
end
