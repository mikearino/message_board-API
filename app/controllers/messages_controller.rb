class MessagesController < ApplicationController

  def index
    @group = Group.find(params[:group_id])
    @messages = @group.messages.all
    json_response(@messages)
  end

  def new
    @group = Group.find(params[:group_id])
    @message = @group.messages.new
    json_response(@message)
  end

  def create
    @group = Group.find(params[:group_id])
    @message = @group.messages.create!(message_params)
    json_response(@message, :created)
  end

  def show
    @group = Group.find(params[:group_id])
    @message = @group.messages.find(params[:id])
    json_response(@message)
  end

  def update
    @group = Group.find(params[:group_id])
    @message = @group.messages.find(params[:id])
    @message.update!(message_params)
    if @message.update!(message_params)
      render status: 200, json: {
        message: "Update successful!"
      }
    end
  end

  def destroy
    @group = Group.find(params[:group_id])
    @message = @group.messages.find(params[:id])
    @message.destroy!
    if @message.destroy!
      render status: 200, json: {
        message: "Message has been deleted!"
      }
    end
  end

  private
  def message_params
    params.permit(:name,:content)
  end
end
