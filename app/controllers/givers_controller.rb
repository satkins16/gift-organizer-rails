class GiversController < ApplicationController
  layout false, only: [:edit]

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
    if @giver.update(giver_params)
      render json: @giver, status: 201
    else
      render :edit
    end
  end

  private

  def giver_params
    params.require(:giver).permit(:name)
 end

end
