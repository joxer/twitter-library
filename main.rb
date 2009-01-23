#!/usr/bin/env ruby

require 'uri'
require 'net/http'

module Tweet
  
  class Status
    
    def initialize(name, passwd)
      
      @name = name
      @passwd = passwd
      
    end

    def status(data = "", format = :json)
      if data.length > 140
        
        puts "message too long"
      else
        
        url = URI.parse("http://twitter.com/statuses/update.#{format.to_s}")
        req = Net::HTTP::Post.new(url.path)
        req.basic_auth "#{@name}", "#{@passwd}"
        req.set_form_data({"status" => "#{data}"}, ';')
        res = Net::HTTP.new(url.host, url.port).start {|http| http.request(req) }
        case res
        when Net::HTTPSuccess
          puts "success"
        else
          puts "failed"
          res.error!
        end
      
      end
      
    end 
    def delete(id = "", format = :json)
      if id.length > 140
        
        puts "message too long"
      else
        
        url = URI.parse("http://twitter.com/statuses/destroy/#{id}.#{format.to_s}")
        req = Net::HTTP::Post.new(url.path)
        req.basic_auth "#{@name}", "#{@passwd}"
        res = Net::HTTP.new(url.host, url.port).start {|http| http.request(req) }
        case res
        when Net::HTTPSuccess
          puts "success"
        else
          puts "failed"
          res.error!
        end
      end
    end
  end
end
