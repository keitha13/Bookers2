class UsersController < ApplicationController
  before_action :authenticate_user!

  def new
  end

  def index
    @book = Book.new
    @user = current_user
    @users = User.all
  end

  def show
    @book = Book.new
    @user = current_user
    @user_find = User.find(params[:id])
    @books = @user_find.books
  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
      render "edit"
    else
      redirect_to user_path(current_user)
    end
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to user_path(@user.id), flash: { notice: "User was successfully updated."}
    else
      render "edit"
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction,)
  end

end
