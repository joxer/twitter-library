#!/usr/bin/env ruby

require 'uri'
require 'net/http'

module Tweet
  
  class Connect
    
    def initialize(name, passwd)

      @name = name
      @passwd = passwd

    end

    def status(data = "", format = "json")
      if data.length > 140
        
        puts "message too long"
      else
        
        url = URI.parse("http://twitter.com/statuses/update.#{format}")
        req = Net::HTTP::Post.new(url.path)
        req.basic_auth "#{@name}", "#{@passwd}"
        req.set_form_data({"status" => "#{data}"}, ';')
        res = Net::HTTP.new(url.host, url.port).start {|http| http.request(req) }
        p res
      end

      
      
    end
  end

end
