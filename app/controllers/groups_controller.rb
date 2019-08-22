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
    @group= Group.create(group_params)
    json_response(@group)
  end

  def update
    @group = Group.find(params[:id])
    @group.destroy
  end

  def destroy
    @group=Group.find(params[:id])
  end

  private
  def json_response(object, status = :ok)
    render json: object, status: status
  end

  def group_params
    params.permit(:topic)
  end

end
