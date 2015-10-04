#encoding: utf-8
class CompaniesController < ApplicationController
  load_and_authorize_resource

  def index
    @companys = Company.page(params[:page])
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(create_company_params)
    
    if @company.save
      redirect_to companies_url, :notice => "公司创建成功"
    else
      render action: 'new'
    end
  end

  def edit
  end

  def update
    @company = Company.find_by_id(params[:id])

    if @company.update_attributes(update_company_params)
      redirect_to edit_company_path(@company), :notice => "公司更新成功"
    else
      render action: 'edit'
    end
  end

  private
  def create_company_params
    params.require(:company).permit(:name)
  end

  def update_company_params
    params.require(:company).permit(:name)
  end
end