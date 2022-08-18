class UsersController < ApplicationController
  def new
   @book = Book.new
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
  end

  def index
   @user  = User.all
  end
  
  def update
   @user = User.find(params[:id])
   @user.update(user_params)
   redirect_to @user
  end
  
  def destroy
   @book = Book.find(params[:id])
   @book.destroy
   redirect_to book_path
  end
   
  private

  def user_params
    params.require(:user).permit(:profile_image,:name,:introduction)
  end
end
