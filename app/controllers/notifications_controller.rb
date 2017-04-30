class NotificationsController < ApplicationController
  before_action :authenticate_user!
  before_action :get_mailbox

  def index
    @notifications = @mailbox.notifications.all
  end

  def show

  end

  def new

  end

  def edit

  end

  def create

  end

  def update
    if params[:read].present?
      if params[:read].eql?("Read")
        @actor.mark_as_read @notification
      elsif params[:read].eql?("Unread")
        @actor.mark_as_unread @notification
      end
    end
    @notifications = @mailbox.notifications.not_trashed.paginate(page: params[:page]).
    render :action => :index
  end

  def update_all
    @notifications = @mailbox.notifications.all
    @actor.mark_as_read @notifications

    if request.xhr?
      render text: ''
    else
      redirect_to notifications_path
    end
  end

  def destroy
    @notification.receipt_for(@actor).move_to_trash
    @notifications = @mailbox.notifications.not_trashed.page(params[:page]).per(10)
    render :action => :index
  end

  private

  def get_notification
    @notification ||= @mailbox.notifications.find(params[:id])
  end

  def get_mailbox
    @mailbox ||= current_user.mailbox
  end

  def check_current_subject_is_owner
    @notification = Notification.find_by_id(params[:id])

    if @notification.nil? #TODO or !@notification.is_receiver?(@actor)
      redirect_to notifications_path
    return
    end
  end


end
