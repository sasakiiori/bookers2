class UsersController < ApplicationController
  def index
    @user = current_user
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
   if @user == current_user
   else
       redirect_to user_path(current_user)
   end
  end

  def update
    user = User.find(params[:id])
    if user.update(user_params)
     flash[:notice] = "You have updated user successfully."
     redirect_to user_path(user.id)
    else
      render :edit
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to '/users'
  end

  private
  def user_params
    params.require(:user).permit(:name, :image, :introduction)
  end

end
