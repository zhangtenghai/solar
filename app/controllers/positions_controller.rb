#encoding: utf-8
class PositionsController < ApplicationController
  load_and_authorize_resource

  def index
    @positions = @positions.page(params[:page])
  end

  def new
    
  end

  def create
    @position = Position.new(create_position_params)
    
    if @position.save
      redirect_to positions_url, :notice => "职位创建成功"
    else
      render action: 'new'
    end
  end

  def edit
  end

  def update
    @position = Position.find_by_id(params[:id])

    if @position.update_attributes(update_position_params)
      redirect_to edit_position_path(@position), :notice => "职位更新成功"
    else
      render action: 'edit'
    end
  end

  private
  def create_position_params
    params.require(:position).permit(:name)
  end

  def update_position_params
    params.require(:position).permit(:name)
  end
end