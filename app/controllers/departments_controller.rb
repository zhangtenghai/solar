#encoding: utf-8
class DepartmentsController < ApplicationController
  load_and_authorize_resource

  def index
    @departments = @departments.page(params[:page])
  end

  def new
    
  end

  def create
    @department = Department.new(create_department_params)
    
    if @department.save
      redirect_to departments_url, :notice => "部门创建成功"
    else
      render action: 'new'
    end
  end

  def edit
  end

  def update
    @department = Department.find_by_id(params[:id])

    if @department.update_attributes(update_department_params)
      redirect_to edit_department_path(@department), :notice => "部门更新成功"
    else
      render action: 'edit'
    end
  end

  private
  def create_department_params
    params.require(:department).permit(:name)
  end

  def update_department_params
    params.require(:department).permit(:name)
  end
end