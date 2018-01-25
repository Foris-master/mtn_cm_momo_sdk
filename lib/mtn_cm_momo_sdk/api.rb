module MtnCmMomoSdk
  # Your code goes here...
  class APIService
    include HTTParty
    base_uri MtnCmMomoSdk.mtn_api_url

    attr_accessor :body

    # @param [Object] transaction
    def initialize(transaction)
      @transaction = transaction.nil? ?
                         {
                             idbouton: 2,
                             typebouton: 'PAIE',
                             _clP: MtnCmMomoSdk.developer_clP,
                             _email: MtnCmMomoSdk.developer_email
                         } : transaction
    end

    # @param [Object] amount
    def buy_now!(tel, amount)
      da = format_data tel, amount
      call_server '/transactionRequest.xhtml', da
    end

    def refund!(tel, amount)
      da = format_data(tel, amount)
      call_server '/transaction.xhtml', da
    end

    def donate!(tel, amount)
      da = format_data(tel, amount)
      call_server '/transaction.xhtml', da
    end

    def checkout!(tel, amount)
      da = format_data(tel, amount)
      call_server '/transactionRequest.xhtml', da
    end

    private

    def format_data(tel, amount)
      tel = tel.gsub("+237", "")
      amount = amount.to_i.to_s
      da = body.merge!(_amount: amount)
               .merge!(_tel: tel)
    end
    def payload(body)
      options = {}
      options.merge!(body: body)
          .merge!(headers: headers)
    end

    def body
      body = {
          idbouton: @transaction[:idbouton],
          typebouton: @transaction[:typebouton],
          _clP: MtnCmMomoSdk.developer_clP,
          _email: MtnCmMomoSdk.developer_email
      }
    end

    def headers
      {'Content-Type' => 'application/json'}
    end

    def call_server(url, data)
      resp = self.class.get(url, query: data)
      if resp.parsed_response == "-1"
        {
            :request_status => false,
            :msg => 'the whole transaction failed',
            :server_respond => resp.parsed_response
        }
      else
        resp = JSON.parse resp.parsed_response
        if resp["StatusCode"] == "01"
          {
              :request_status => true,
              :msg => 'Successfully processed transaction',
              :server_respond => resp
          }
        else
          {
              :request_status => false,
              :msg => 'General failure',
              :server_respond => resp
          }
        end
      end

    rescue Net::ReadTimeout
      {
          msg: 'User does not authorize the request',
          request_status: false,
          server_respond: nil

      }
    rescue Net::OpenTimeout
      {
          msg: 'could not connect to mtn server, please check your internet connection',
          request_status: false,
          server_respond: nil

      }
    rescue SocketError
      {
          msg: 'could not connect to mtn server, please check your internet connection',
          request_status: false,
          server_respond: nil

      }
    rescue => ex
      {
          msg: ex.message,
          request_status: false,
          server_respond: nil

      }
    end
  end
end
