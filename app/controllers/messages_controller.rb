class MessagesController < ApplicationController
  before_filter :authenticate_user!

  def create
    @conversation = Conversation.find(params[:conversation_id])
    @message = @conversation.messages.build(message_params)
    @message.user_id = current_user.id
    @message.save!

    @path = conversation_path(@conversation)
    # @path = "/#{:user_id}/conversations"(@conversation) 
    # パスの指定間違い？

  end

  private

  def message_params
    params.require(:message).permit(:body)
  end
end