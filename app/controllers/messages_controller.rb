class MessagesController < ApplicationController
  before_action :authenticate_user!

  def index
    @received_messages = current_user.received_messages
    @sent_messages = current_user.sent_messages
  end

  def new
    @message = Message.new
  end

  def create
    @message = current_user.sent_messages.build(message_params)
    if @message.save
      redirect_to messages_path, notice: 'Message sent successfully.'
    else
      render :new
    end
  end

  private

  def message_params
    params.require(:message).permit(:sender_id, :receiver_id, :body)
  end
end
