class Admin::UsersController < ApplicationController

  def index
    @users = User.all.page(params[:page]).per(10)
  end

  def show
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "編集しました"
      redirect_to admin_users_path
    else
      flash[:alert] = "空欄を入力してください"
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction, :email, :encrypted_password, :members_status)
  end

end
