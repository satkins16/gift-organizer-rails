class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  helper_method :current_gift_event

  def users_index

    @users = User.all_formatted
    render applications: 'users_index'
    
  end

  private

  def current_gift_event
    @event ||= Event.find(params[:event_id])
  end

  def current_event
    @event ||= Event.find(params[:id])
  end



  def current_user_givers
    @givers = []
    current_user.gifts.each do |gift|
      gift.givers.each do |giver|
        if !@givers.include? giver
          @givers << giver
        end
      end
    end

    @givers
  end

  def after_sign_in_path_for(resource)
    request.env['omniauth.origin'] || root_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

end
