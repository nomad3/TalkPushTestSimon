require "redis"

module Pushtalk
  class Service
    attr_reader :config, :data, :list
    
    def initialize(config, request=Requester.new(config), redis=Redis.new, logger=Logger.new(STDOUT))
      @config  = config
      @request = request
      @redis   = redis
      @logger  = logger
      @list    = Array.new
    end

    def get
      begin
        @data = Importer.new(@request.get).parse
      rescue => err
        logger.fatal(err)
      end
      
      self
    end

    def filter
      @list = @data.reject do |item|
        @redis.get "pushtalk:model:#{item.email}"
      end
      
      self
    end

    def push
      begin
        @list.map do |item|
          @logger.info "pushing #{item.email}"
          result = @request.push item
          
          @redis.set "pushtalk:model:#{item.email}", result if result
        end
      rescue => err
        @logger.fatal(err)
      end
    end
  end
end
