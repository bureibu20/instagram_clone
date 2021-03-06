class UsersController < ApplicationController
  skip_before_action :login_required, only: [:new, :create]
  def new
    @user = User.new
  end
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user.id)
    else
      render :new
    end
  end
  def confirm
    @user = current_user.users.build(user_params)
    render :new if @user.invalid?
  end
  def edit
    @user = User.find(params[:id])
  end
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path, notice: "プロフィールを編集しました！"
    else
      render :edit
    end
  end
  def show
    @user = User.find(params[:id])
    @feeds = @user.feeds

    favorites = Favorite.where(user_id: current_user.id).pluck(:feed_id)
    @favorite_list = Feed.find(favorites)
  end
  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :image)
  end
end
