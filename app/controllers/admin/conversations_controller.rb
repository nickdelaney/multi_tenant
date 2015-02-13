class Admin::ConversationsController < ApplicationController
  before_action :authenticate_user!
  before_action :get_mailbox
  before_action :get_conversation, except: [:index]
  add_breadcrumb "Messages", :admin_conversations_path
  def index
    @conversations = @mailbox.inbox.paginate(page: params[:page], per_page: 10)
  end

  def show
    add_breadcrumb "Message", :admin_conversation_path
  end

  def reply
    add_breadcrumb "Reply", :reply_admin_conversation_path
  current_user.reply_to_conversation(@conversation, params[:body])
  flash[:success] = 'Reply sent'
  redirect_to admin_conversation_path(@conversation)
  end
 
  private
 
  def get_mailbox
    @mailbox ||= current_user.mailbox
  end

  def get_conversation
    @conversation ||= @mailbox.conversations.find(params[:id])
  end
end
