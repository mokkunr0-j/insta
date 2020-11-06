class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  before_action :logged_in_user, only: [:show, :edit, :update]
  def new
    @user = User.new
  end
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to new_session_path, notice: 'アカウントが作成されました！'
    else
      render :new
    end
  end
  def show
    if @user.id == current_user.id
    else
      redirect_to new_session_path
    end
  end

  def edit
    if @user.id == current_user.id
    else
      redirect_to new_session_path
    end
  end

  def update
    if @user.update(user_params)
      redirect_to user_path, notice: 'プロフィールを編集しました'
    else
      render :edit
    end
  end
  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :profile, :user_image)
  end
  def set_user
    @user = User.find(params[:id])
  end
end
