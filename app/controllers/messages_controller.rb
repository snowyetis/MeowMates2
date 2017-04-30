class MessagesController < ApplicationController
  before_action :authenticate_user!
  # TODO: Keep to look up animals per notification.
  # before_action :set_animal, only: [:adoption_create]

 def new
 end

 def create
   recipients = User.where(id: params['recipients'])
   conversation = current_user.send_message(recipients, params[:message][:body], params[:message][:subject]).conversation
   flash[:success] = "Message has been sent!"
   redirect_to conversation_path(conversation)
 end

 def adoption_create
     @user = User.find_by(id: params[:user_id])
     @user.notify("An adoption request has been sent to you!", "Animal Request")

     redirect_to animals_path, notice: "An adoption request has been sent to the owner."
 end

 # def set_animal
 #   @animal = Animal.find(params[:id])
 # end

end
