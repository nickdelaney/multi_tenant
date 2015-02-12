class Admin::MessagesController < ApplicationController
  before_action :authenticate_user!

  def new
  end
 
  def create
    recipients = User.where(id: params['recipients'])
    conversation = current_user.send_message(recipients, params[:message][:body], params[:message][:subject]).conversation
    flash[:success] = "Message has been sent!"
    redirect_to admin_conversation_path(conversation)
  end
end
