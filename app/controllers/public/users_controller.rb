class Public::UsersController < ApplicationController

  # ゲストユーザーでedit画面に遷移させない
  before_action :ensure_guest_user, only: [:edit,:unsubscribe]

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.page(params[:page]).per(5)
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

  def favorites
    @user = User.find(params[:id])
    favorites = Favorite.where(user_id: @user.id).pluck(:post_id)
    @favorite_posts = Post.find(favorites)
  end

  def unsubscribe
  end

  def withdraw
    @user = current_user
    @user.update(members_status: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end


  # 投稿データのストロングパラメータ
  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction, :email, :encrypted_password, :members_status)
  end

  # ゲストユーザーでedit画面に遷移させない
  def ensure_guest_user
    @user = User.find(params[:id])
    if @user.name == "ゲストユーザー"
      redirect_to user_path(current_user) , flash[:notice] = 'ゲストユーザーはプロフィール編集画面へ遷移できません。'
    end
  end

end