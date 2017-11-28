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

      da =body.merge!(_amount: amount)
              .merge!(_tel: tel)
      # da =  payload(da)
      begin
        self.class.get('/transactionRequest.xhtml', query: da)
      rescue Net::ReadTimeout
        {
            :msg => "User does not authorize the request",
            :request_status => false
        }
      end
    end

    def refund!(tel, amount)

      da =body.merge!(_amount: amount)
              .merge!(_tel: tel)
      #da =  payload(da)
      self.class.get('/transaction.xhtml', query: da)
    end

    def donate!(tel, amount)

      da =body.merge!(_amount: amount)
              .merge!(_tel: tel)
      #da =  payload(da)
      self.class.get('/transaction.xhtml', query: da)
    end

    def checkout!(tel, amount)

      da =body.merge!(_amount: amount)
              .merge!(_tel: tel)
      #da =  payload(da)
      begin
        self.class.get('/transactionRequest.xhtml', query: da)
      rescue Net::ReadTimeout
        {
            :msg => "User does not authorize the request",
            :request_status => false
        }
      end
    end


    private

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
  end
end
