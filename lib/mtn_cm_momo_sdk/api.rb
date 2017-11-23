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
      payload.merge(_amount: amount,
                    _tel: tel)
      resp = self.class.get('transactionRequest.xhtml', payload)
    end

    def refund!(tel, amount)
      payload.merge(_amount: amount,
                    _tel: tel)
      resp = self.class.get('transaction.xhtml', payload)
    end

    def donate!(tel, amount)
      payload.merge(_amount: amount,
                    _tel: tel)
      resp = self.class.get('transaction.xhtml', payload)
    end

    def checkout!
      payload.merge(_amount: amount,
                    _tel: tel)
      resp = self.class.get('transactionRequest.xhtml', payload)
    end

    def payload
      options = {}
      options.merge!(body: body)
          .merge!(headers: headers)
    end

    private

    def body
      body = {
          idbouton: @transaction.idbouton,
          typebouton: @transaction.typebouton,
          _clP: MtnCmMomoSdk.developer_clP,
          _email: MtnCmMomoSdk.developer_email
      }

      body.to_json
    end

    def headers
      {'Content-Type' => 'application/json'}
    end
  end
end
