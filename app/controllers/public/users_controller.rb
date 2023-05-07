class Public::UsersController < ApplicationController

  def show
    @user = current_user
    @posts = @user.posts
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      flash[:notice] = "編集しました"
      redirect_to user_path(@user)
    else
      flash[:alert] = "空欄を入力してください"
      redirect_to edit_post_path(@post)
    end
  end


  # 投稿データのストロングパラメータ
  private

  def user_params
    params.require(:user).permit(:name, :image, :introduction, :email, :encrypted_password, :members_status)
  end

end