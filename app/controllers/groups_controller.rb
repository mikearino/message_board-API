class GroupsController < ApplicationController

  def index
    @groups= Group.all
    json_response(@groups)
  end

  def show
    @group= Group.find(params[:id])
    json_response(@group)
  end

  def create
    @group= Group.create!(group_params)
    json_response(@group)
  end

  def update
    @group = Group.find(params[:id])
    @group.update!(group_params)
    if @group.update!(group_params)
      render status: 200, json: {
        message: "This group has been updated successfully."
      }
    end
  end


  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    if @group.destroy!
      render status: 200, json: {
        message: "This group has been destroyed successfully."
      }
    end
  end

  private
  def json_response(object, status = :ok)
    render json: object, status: status
  end

  def group_params
    params.permit(:topic)
  end

end
