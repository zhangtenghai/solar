#encoding: utf-8
class UsersController < ApplicationController
  load_and_authorize_resource

  def index
    @users = @users.page(params[:page])
  end

  def new
    
  end

  def create
    @user = User.new(create_user_params)
    
    if params[:user][:password].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end
    
    if @user.save
      redirect_to users_url, :notice => "账户创建成功"
    else
      render action: 'new'
    end
  end

  def edit
  end

  def update
    u_params = create_user_params

    @user = User.find_by_id(params[:id])

    if u_params[:password].blank?
      u_params.delete("password")
      u_params.delete("password_confirmation")
    end

    if @user.update_attributes(u_params)
      if params[:locked] == "1"
        @user.lock_access!
      else
        @user.unlock_access!
      end

      redirect_to edit_admin_user_path(@user), :notice => "账户更新成功"
    else
      render action: 'edit'
    end
  end

  private
  def create_user_params
    params.require(:user).permit(:name,:no,:level,:company_id,:memo,:no_job,:department, :email, :password, :password_confirmation)
  end

end