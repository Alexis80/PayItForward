class MessagesController < ApplicationController
  #modified from https://medium.com/@danamulder/tutorial-create-a-simple-messaging-system-on-rails-d9b94b0fbca1 on 4/22/19
  before_action do
    @conversation = Conversation.find(params[:conversation_id])
  end

  def index
    @messages = @conversation.messages
    if @messages.length > 10
      @over_ten = true
      @messages = @messages[-10..-1]
    end
    if params[:m]
      @over_ten = false
      @messages = @conversation.messages
    end
    if @messages.last
      if @messages.last.user_id != current_user.id
        @messages.last.read = true;
      end
    end

    @message = @conversation.messages.new
  end

  def new
    @message = @conversation.messages.new
  end

  def create
    @message = @conversation.messages.new(message_params)
    if @message.save
      redirect_to conversation_messages_path(@conversation)
    end
  end

  def access
   @message = @conversation.messages.new(:body => "This user is requesting access to your address. Click the 'Give Access' button to accept.",
   :user_id => current_user.id)
   @message.save
   redirect_to conversation_messages_path(@conversation)
   
  end
private
  def message_params
    params.require(:message).permit(:body, :user_id)
  end
end
