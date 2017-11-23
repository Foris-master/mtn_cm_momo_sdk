MtnCmMomoSdk.setup do |config|

  # ==> Configuration for the Ionic API Key
  # The  API Key for your application can be found
  # within the Settings of your application on
  # https://apps.ionic.io/apps
  config.developer_email = ENV["MTN_DEVELOPER_EMAIL"]
  config.developer_clP = ENV["MTN_DEVELOPER_CLP"]

  # ==> Configuration for the location of the API
  # Refer to the Mtn developer site  documentation for the correct location

  # defaults to https://developer.mtn.cm/OnlineMomoWeb/faces/transaction/
  # config.mtn_api_url = ENV["MTN_API_URL"]
end
