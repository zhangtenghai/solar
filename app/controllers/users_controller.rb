#encoding: utf-8
class UsersController < ApplicationController
  load_and_authorize_resource

  def index
    @users = @users.search(params[:search]).page(params[:page])
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
    u_params = update_user_params

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

      redirect_to edit_user_path(@user), :notice => "账户更新成功"
    else
      render action: 'edit'
    end
  end

  private
  def create_user_params
    params.require(:user).permit(:phone, :name,:no,:level,:company_id,:memo,:no_job,:department_id,:position_id,
      :email, :password, :password_confirmation, :position,:entry_at,:turnover_at,:sex,
      :cid,:birthday, :contract_effectived_at, :contract_expired_at, :salary_record,:bank_no,
      :school, :education, :major, :certificate, :history_company1, :history_position1,
      :history_company2, :history_position2,:history_company3, :history_position3,:address,
      :nation, :faith, :marital_status, :spouse_name, :spouse_company, :has_children,
      :emergency_contact, :emergency_phone)
  end

  def update_user_params
    params.require(:user).permit(:phone, :name,:no,:level,:company_id,:memo,:no_job,:department_id,:position_id,
      :email, :password, :password_confirmation, :position,:entry_at,:turnover_at,:sex,
      :cid,:birthday, :contract_effectived_at, :contract_expired_at, :salary_record,:bank_no,
      :school, :education, :major, :certificate, :history_company1, :history_position1,
      :history_company2, :history_position2,:history_company3, :history_position3,:address,
      :nation, :faith, :marital_status, :spouse_name, :spouse_company, :has_children,
      :emergency_contact, :emergency_phone)
  end
end