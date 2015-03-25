class Admin::MessagesController < AdminController
  before_action :authenticate_user!
  add_breadcrumb "Messages", :admin_conversations_path
  def new

  	add_breadcrumb "New Message", :new_admin_message_path
  end
 
  def create
    recipients = User.where(id: params['recipients'])
    conversation = current_user.send_message(recipients, params[:message][:body], params[:message][:subject]).conversation
    flash[:success] = "Message has been sent!"
    redirect_to admin_conversation_path(conversation)
  end
end
