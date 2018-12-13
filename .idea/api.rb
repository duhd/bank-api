#!/usr/bin/env ruby
# encoding: utf-8

require 'sinatra'
require 'json'
require 'date'
require 'telegram/bot'

set :run, true
set :sever, 'thin'
set :bind, '0.0.0.0'
set :port, 8085

get '/' do
  "Hello this is Bank Interface"
end

accounts_db = {'109200' => 'Nguyen Van B', '109900' => 'Tran Thi C', '109000' => 'Ly Thi T', '109100' => 'Lo Van P', '109800' => 'Pham Tien D', '103401' => 'Kinh Van H', '103300' => 'Le Thi L', '102600' => 'Le Tien E'}

accounts_db1 =

    post "/v1/getAccountName" do
      content_type :json
      request.body.rewind  # in case someone already read it
      post_data = request.body.read
      logger.info post_data
      begin
        data = JSON.parse post_data

        if (accounts_db[data['accountNo']])
          msg = "{\"accountName\":\"#{accounts_db[data['accountNo']]}\"}"
        else
          msg = "{\"accountName\":\"Account Not Found\"}"
        end
      rescue JSON::ParserError
        msg = "Invalid json string: #{post_data}"
      end
      logger.info msg
      # Reponse to Client
      msg
    end

post "/v1/receiverFund" do
  content_type :json
  request.body.rewind  # in case someone already read it
  post_data = request.body.read
  begin
    #data = JSON.parse post_data
    #Ghi no tai khoan nghiep vu
    #Ghi co tai khoan nguon nhan
    logger.info "Message chuyen tien"
    logger.info "Ghi no tai khoan nghiep vu | Ghi co tai khoan nguon nhan"
    logger.info "Message: #{post_data}"
    status = 00
    #Gui thong bao bien dong so du
    token = "594848548:AAFdUUpOfQVae2r4DWEwMtzYQir0I2ZTyC8"
    chat_id = "-1001263295205"
    bot = Telegram::Bot::Client.new(token)
    bot.api.send_message(chat_id:chat_id,text:post_data)

  rescue JSON::ParserError
    logger.info "Invalid json string: #{post_data}"
    status = 99
  end
  # Reponse to Client
  "#{status}"
end

post "/v1/sentMoney" do
  content_type :json
  request.body.rewind  # in case someone already read it
  post_data = request.body.read
  begin
    #data = JSON.parse post_data
    #Ghi no tai khoan nghiep vu
    #Ghi co tai khoan nguon nhan
    logger.info "Message chuyen tien"
    logger.info "Ghi no tai khoan nghiep vu | Ghi co tai khoan nguon nhan"
    logger.info "Message: #{post_data}"
    status = 00
    #Gui thong bao bien dong so du
    token = "594848548:AAFdUUpOfQVae2r4DWEwMtzYQir0I2ZTyC8"
    chat_id = "-1001263295205"
    bot = Telegram::Bot::Client.new(token)
    bot.api.send_message(chat_id:chat_id,text:post_data)

  rescue JSON::ParserError
    logger.info "Invalid json string: #{post_data}"
    status = 99
  end
  # Reponse to Client
  "#{status}"
end