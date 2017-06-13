# Copyright (c) 2015, @sudharti(Sudharsanan Muralidharan)
# Socify is an Open source Social network written in Ruby on Rails This file is licensed
# under GNU GPL v2 or later. See the LICENSE.

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?
  before_action :get_message_count, if: :user_signed_in?
  before_action :get_notifications, if: :user_signed_in?

  def get_message_count
    # if user_signed_in?
      @messages_count = current_user.mailbox.inbox(:unread => true).count(:id)
      if @messages_count.blank?
        @messages_count = 0
      end
    # end
  end

  def get_notifications
    @notifications = current_user.mailbox.notifications(:read => false)
  end

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :password_confirmation])
      devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :remember_me])
    end

    rescue_from ActiveRecord::RecordNotFound do
      flash[:notice] = 'Resource not found.'
      redirect_back_or root_path
    end

    def redirect_back_or(path)
      redirect_to request.referer || path
    end

    include PublicActivity::StoreController

end
