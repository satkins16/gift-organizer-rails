class GiversController < ApplicationController

  def index
    @givers = []
    current_user.gifts.each do |gift|
      gift.givers.each do |giver|
        if !@givers.include? giver
          @givers << giver
        end
      end
    end
  end

  def show
    @giver = Giver.find(params[:id])
  end

end
