require "date"

module Pushtalk
  class Model
    attr_accessor :timestamp, :first_name, :last_name, :email, :phone_number

    def initialize(timestamp, first_name, last_name, email, phone_number)
      @timestamp    = Date.strptime timestamp, "%m/%d/%Y %H:%M:%S"
      @first_name   = first_name
      @last_name    = last_name
      @email        = email
      @phone_number = phone_number
    end
    
    def to_lead
      {
        "first_name" => @first_name,
        "last_name"  => @last_name,
        "email"      => @email,
        "user_phone_number" => @phone_number,
        "source"     => "Google Form",
      }
    end
  end
end
