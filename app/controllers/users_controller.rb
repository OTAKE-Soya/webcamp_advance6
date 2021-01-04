class UsersController < ApplicationController
  before_action :ensure_correct_user, only: [:update, :edit]

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
    @set_relationship = current_user.active_relationships.new
    @relationsip = current_user.active_relationships.find_by(followed_id: @user.id)
  end

  def index
    @users = User.all
    @book = Book.new
    @set_relationship = current_user.active_relationships.new
    @relationsips = current_user.active_relationships
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "You have updated user successfully."
    else
      # @user = User.find(params[:id])
      render :edit
    end
  end
  
  def following
    @user = User.find(params[:id])
  end
  
  def followers
    @user = User.find(params[:id])
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def ensure_correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user)
    end
  end
end
