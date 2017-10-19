class GiversController < ApplicationController

  def index
    @givers = current_user_givers
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
