#
# Autogenerated by Thrift
#
# DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
#

require 'types_types'
require 'errors_types'


module Evernote
  module EDAM
    module UserStore
            #  This structure is used to provide publicly-available user information
            #  about a particular account.
            # <dl>
            #  <dt>userId:</dt>
            #    <dd>
            #    The unique numeric user identifier for the user account.
            #    </dd>
            #  <dt>shardId:</dt>
            #    <dd>
            #    The name of the virtual server that manages the state of
            #    this user. This value is used internally to determine which system should
            #    service requests about this user's data.  It is also used to construct
            #    the appropriate URL to make requests from the NoteStore.
            #    </dd>
            #  <dt>privilege:</dt>
            #    <dd>
            #    The privilege level of the account, to determine whether
            #    this is a Premium or Free account.
            #    </dd>
            #  </dl>
            class PublicUserInfo
              include ::Thrift::Struct
              USERID = 1
              SHARDID = 2
              PRIVILEGE = 3
              USERNAME = 4

              ::Thrift::Struct.field_accessor self, :userId, :shardId, :privilege, :username
              FIELDS = {
                USERID => {:type => ::Thrift::Types::I32, :name => 'userId'},
                SHARDID => {:type => ::Thrift::Types::STRING, :name => 'shardId'},
                PRIVILEGE => {:type => ::Thrift::Types::I32, :name => 'privilege', :optional => true, :enum_class => Evernote::EDAM::Type::PrivilegeLevel},
                USERNAME => {:type => ::Thrift::Types::STRING, :name => 'username', :optional => true}
              }

              def struct_fields; FIELDS; end

              def validate
                raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Required field userId is unset!') unless @userId
                raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Required field shardId is unset!') unless @shardId
                unless @privilege.nil? || Evernote::EDAM::Type::PrivilegeLevel::VALID_VALUES.include?(@privilege)
                  raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Invalid value of field privilege!')
                end
              end

            end

            #  When an authentication (or re-authentication) is performed, this structure
            #  provides the result to the client.
            # <dl>
            #  <dt>currentTime:</dt>
            #    <dd>
            #    The server-side date and time when this result was
            #    generated.
            #    </dd>
            #  <dt>authenticationToken:</dt>
            #    <dd>
            #    Holds an opaque, ASCII-encoded token that can be
            #    used by the client to perform actions on a NoteStore.
            #    </dd>
            #  <dt>expiration:</dt>
            #    <dd>
            #    Holds the server-side date and time when the
            #    authentication token will expire.
            #    This time can be compared to "currentTime" to produce an expiration
            #    time that can be reconciled with the client's local clock.
            #    </dd>
            #  <dt>user:</dt>
            #    <dd>
            #    Holds the information about the account which was
            #    authenticated if this was a full authentication.  May be absent if this
            #    particular authentication did not require user information.
            #    </dd>
            #  <dt>publicUserInfo:</dt>
            #    <dd>
            #    If this authentication result was achieved without full permissions to
            #    access the full User structure, this field may be set to give back
            #    a more limited public set of data.
            #    </dd>
            #  </dl>
            class AuthenticationResult
              include ::Thrift::Struct
              CURRENTTIME = 1
              AUTHENTICATIONTOKEN = 2
              EXPIRATION = 3
              USER = 4
              PUBLICUSERINFO = 5

              ::Thrift::Struct.field_accessor self, :currentTime, :authenticationToken, :expiration, :user, :publicUserInfo
              FIELDS = {
                CURRENTTIME => {:type => ::Thrift::Types::I64, :name => 'currentTime'},
                AUTHENTICATIONTOKEN => {:type => ::Thrift::Types::STRING, :name => 'authenticationToken'},
                EXPIRATION => {:type => ::Thrift::Types::I64, :name => 'expiration'},
                USER => {:type => ::Thrift::Types::STRUCT, :name => 'user', :class => Evernote::EDAM::Type::User, :optional => true},
                PUBLICUSERINFO => {:type => ::Thrift::Types::STRUCT, :name => 'publicUserInfo', :class => Evernote::EDAM::UserStore::PublicUserInfo, :optional => true}
              }

              def struct_fields; FIELDS; end

              def validate
                raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Required field currentTime is unset!') unless @currentTime
                raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Required field authenticationToken is unset!') unless @authenticationToken
                raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Required field expiration is unset!') unless @expiration
              end

            end

          end
        end
      end
