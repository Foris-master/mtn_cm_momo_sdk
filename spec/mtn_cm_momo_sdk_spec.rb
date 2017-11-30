require 'spec_helper'

describe 'CallingServer' do
  it 'should do initiate api' do
    @svr = MtnCmMomoSdk::APIService.new nil
    expect(@svr).to_not eq nil
  end
  it 'should buy now' do
    @svr = MtnCmMomoSdk::APIService.new nil
    MtnCmMomoSdk.setup do |config|
      config.developer_email = ENV["MTN_DEVELOPER_EMAIL"]
      config.developer_clP = ENV["MTN_DEVELOPER_CLP"]
    end

    @resp = @svr.buy_now! '678181114', 50
    puts @resp
    expect(@resp).to_not eq nil
  end
  it 'should refund' do
    @svr = MtnCmMomoSdk::APIService.new nil
    MtnCmMomoSdk.setup do |config|
      config.developer_email = ENV["MTN_DEVELOPER_EMAIL"]
      config.developer_clP = ENV["MTN_DEVELOPER_CLP"]
    end

    @resp = @svr.refund! '678181114', 50
    puts @resp
    expect(@resp).to_not eq nil
  end
end
