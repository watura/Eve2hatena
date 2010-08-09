require 'oauth/consumer'
require 'oauth/signature/PLAINTEXT'

module OAuth #:nodoc:
  VERSION = '0.4.1'
end

require "net/http"

@consumer=OAuth::Consumer.new(
                              "watura", 
                              "dcfd22cf4793597f", 
                              {
                                :site               => "http://sandbox.evernote.com",
                                :http_method        => :get,
                                :signature_method => "plaintext", 
                                :request_token_path => "/oauth",
                                :access_token_path  => "/oauth",
                                :authorize_path     => "/OAuth.action?format=microclip"
                              }
                              
                              )
@request_token = @consumer.get_request_token          

puts @request_token.authorize_url(:oauth_callback => "http://sis-w.net:4567")
oauth_token = gets.chomp.strip
@access_token = @request_token.get_access_token(
                                                :oauth_verifier => oauth_token,
                                                :oauth_token => @request_token.token,
                                                )


puts "Access token: #{@access_token.token}"
puts @access_token.secret
