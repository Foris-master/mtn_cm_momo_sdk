require 'rails'
require 'httparty'

module MtnCmMomoSdk
  # Your code goes here...
  # Registered application if for the ionic platform
  mattr_accessor :developer_email
  @@developer_email = ""

  mattr_accessor :developer_clP
  @@developer_clP = ""

  mattr_accessor :check_ssl
  @@check_ssl = true

  # API URL
  mattr_accessor :mtn_api_url
  @@mtn_api_url = "https://developer.mtn.cm/OnlineMomoWeb/faces/transaction/"

  def self.setup
    yield self
  end


end

require "mtn_cm_momo_sdk/api"
