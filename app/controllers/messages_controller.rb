class MessagesController < ApplicationController
  before_action :authenticate_user!


 def new
 end

 def create
   recipients = User.where(id: params['recipients'])
   conversation = current_user.send_message(recipients, params[:message][:body], params[:message][:subject]).conversation
   flash[:success] = "Message has been sent!"
   redirect_to conversation_path(conversation)
 end

 def adoption_create

   notification = Mailboxer::NotificationBuilder.new({
      type: Mailboxer::Notification,
      sender_type: 'User',
      sender_id: current_user.id,
      recipients: User.where(id: params['recipients']),
      subject: "has sent you an adoption request",
      body: "has sent you an adoption request"
     }).build

     notification.deliver

     redirect_to animals_path, notice: "An adoption request has been sent to the owner."
 end

end
