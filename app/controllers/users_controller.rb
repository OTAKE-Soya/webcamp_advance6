class UsersController < ApplicationController
  before_action :ensure_correct_user, only: [:update, :edit]

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
    @set_relationship = current_user.active_relationships.new
    @relationships = current_user.active_relationships
  end

  def index
    @users = User.all
    @book = Book.new
    @set_relationship = current_user.active_relationships.new
    @relationships = current_user.active_relationships
    p "aaaaaaaaaaaaaaa"
    p current_user.active_relationships.all
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
    @users = @user.following
    @set_relationship = current_user.active_relationships.new
    @relationships = current_user.active_relationships
  end
  
  def followers
    @user = User.find(params[:id])
    @users = @user.followers
    @set_relationship = current_user.active_relationships.new
    @relationships = current_user.active_relationships
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
