class GiftsController < ApplicationController

  def new
    @gift = Gift.new
  end

  def create
    gift = Gift.create(gift_params)
  end
  

end
