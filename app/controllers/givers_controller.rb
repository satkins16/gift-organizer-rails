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

  def edit
    @giver = Giver.find(params[:id])
  end

  def update
    @giver = Giver.find(params[:id])
    @giver.update(giver_params)

    redirect_to giver_path(@giver)
  end

  private

  def giver_params
    params.require(:giver).permit(:name)
 end

end
