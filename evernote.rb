

require 'oauth/consumer'
require 'oauth/signature/PLAINTEXT'
require "thrift"
require "Evernote/EDAM/user_store"
require "Evernote/EDAM/user_store_constants.rb"
require "Evernote/EDAM/note_store"
require "Evernote/EDAM/limits_constants.rb"

module OAuth #:nodoc:
  VERSION = '0.4.1'
end

require "net/http"
=begin
@consumer=OAuth::Consumer.new(
                              "watura", 
                              "dcfd22cf4793597f", 
                              {
                                :site               => "http://sandbox.evernote.com",
                                :http_method        => :get,
                                :signature_method => "plaintext", 
                                :request_token_path => "/oauth",
                                :access_token_path  => "/oauth",
                                :authorize_path     => "/OAuth.action"
                              }
                              
                              )
@request_token = @consumer.get_request_token          

puts @request_token.authorize_url(:oauth_callback => "http://sis-w.net:4567")
oauth_token = gets.chomp.strip
@access_token = @request_token.get_access_token
puts "Access token: #{@access_token.token}\n#{p @access_token.token}"
=end


noteStoreUrl = "http://sandbox.evernote.com/edam/note/s1"
noteStoreTransport = Thrift::HTTPClientTransport.new(noteStoreUrl)
noteStoreProtocol = Thrift::BinaryProtocol.new(noteStoreTransport)
noteStore = Evernote::EDAM::NoteStore::NoteStore::Client.new(noteStoreProtocol)

@access_token = "S=s1:U=388a:E=12a60aa5801:C=12a5b83fc01:P=7:A=watura:H=dc3b3a40e991faa7ebe315daabcfd551"
#puts noteStore.listNotebooks(@access_token)



filter_tag = "Blog"
filter = Evernote::EDAM::NoteStore::NoteFilter.new
filter.words = "tag:#{ filter_tag}"
res = noteStore.findNotes(@access_token, filter, 0, 100)

res.notes.each do |note|
  if note.resources
    note.resources.each do |resource|
      data = noteStore.getResource(@access_token, resource.guid, true, true, true, true)
      puts hex = data.data.bodyHash.unpack('H*').first
      ext = case data.mime
            when 'image/png'
              'png'
            when 'image/jpeg'
              'jpg'
            else
              raise "Unknown mime type: #{data.mime}"
            end
      File.open("/Users/watura/Downloads/instev/#{hex}.#{ext}", 'w') { |f| f.write(data.data.body)}
    end
  end
  content = noteStore.getNoteContent(@access_token, note.guid)
  puts content
end
