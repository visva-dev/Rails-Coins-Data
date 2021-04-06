class HomeController < ApplicationController
  def index
    @url = "https://sandbox-api.coinmarketcap.com/v1/cryptocurrency/listings/latest?CMC_PRO_API_KEY=#{Rails.application.credentials.coins[:coins_api_key]}&start=1&limit=5000&convert=USD"
    @uri = URI(@url)
    @response = Net::HTTP.get(@uri)
    @coins = JSON.parse(@response)
    @my_coins = %w[BTC XRP ADA XLM STEEM]
  end

  def about; end

  def lookup
    @url = "https://sandbox-api.coinmarketcap.com/v1/cryptocurrency/listings/latest?CMC_PRO_API_KEY=#{Rails.application.credentials.coins[:coins_api_key]}&start=1&limit=5000&convert=USD"
    @uri = URI(@url)
    @response = Net::HTTP.get(@uri)
    @lookup_coin = JSON.parse(@response)
    @symbol = params[:sym]
    @symbol = @symbol.upcase if @symbol
    @symbol = 'You forgot to enter a symbol!' if @symbol == ''
  end
end
