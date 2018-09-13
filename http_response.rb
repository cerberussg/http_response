#!/usr/bin/env ruby
#
# Scott Goyette
# 2018-09-11
# scott_goyette@comcast.com, scott.goyette@rubypythmore.com
# HTTP Response
# Sends HTTP request returns HTTP code
# Implementation use case:
# Heroku apps like to sleep, sidekiq this to keep them FREE dynos awake
# Dashboard the response codes so you always know sites are up

require 'net/http'

class HTTPResponse

  def http_response_code(host)
    begin
      address = URI.parse(host)
      request = Net::HTTP::Get.new(address.to_s)
      response = Net::HTTP.start(address.host, address.port) {|http|
        http.request(request)
      }
      response.code
    rescue
      return "HTTP address format error"
    end
  end

  def http_response_message(host)
    begin
      address = URI.parse(host)
      request = Net::HTTP::Get.new(address.to_s)
      response = Net::HTTP.start(address.host, address.port) {|http|
        http.request(request)
      }
      response.message
    rescue
      return "HTTP address format error"
    end
  end

  def http_response_body(host)
    begin
      address = URI.parse(host)
      request = Net::HTTP::Get.new(address.to_s)
      response = Net::HTTP.start(address.host, address.port) {|http|
        http.request(request)
      }
      return response.body if response.body != ""
      return "No sites hosted from URI"
    rescue
      return "HTTP address format error"
    end
  end
end

# New instance of class
@code = HTTPResponse.new

# Input from user
puts 'Enter A website to return its HTTP code (sample format: http://google.com)'
http_host = gets.chomp

# HTTP Response Code
puts @code.http_response_code(http_host)
# HTTP Response Message
puts @code.http_response_message(http_host)
# HTTP Response Body
puts @code.http_response_body(http_host)