require "rqrcode"

class QrcodesController < ApplicationController

  def show
    @box = Box.find(params[:box_id])
    @heroku = "https://www.boxtag.me/boxes/#{@box.id}"
    # https + @box

    # @qrcode = RQRCode::QRCode.new("https://kyan.com")

    @qrcode = RQRCode::QRCode.new( @heroku.to_s, :size => 4, :level => :h )


    # IO.binwrite("app/assets/images/qrcode.svg", @svg.to_s)


  end





end
