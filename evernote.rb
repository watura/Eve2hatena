require 'oauth/consumer'
require 'oauth/signature/PLAINTEXT'
module OAuth #:nodoc:
  VERSION = '0.3.7.pre1'
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
puts @consumer.options
puts OAuth::Signature.available_methods
@request_token = @consumer.get_request_token          

puts @request_token.authorize_url

