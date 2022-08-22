class UsersController < ApplicationController
before_action :current_user, only: [:edit, :update]

  def new
   @book = Book.new
  end

  def show
   @user = User.find(params[:id])
   @book = Book.new
  end

  def create
   @book = Book.new(book_params)
   @book.user_id = current_user.id
   if @book.save
       redirect_to book_path(@book)
   else
       render :index
   end


  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
     render "edit"
    else
     redirect_to user_path(@user)
    end
  end

  def index
   @users = User.all
   @book = Book.new
   @user = User.find(current_user.id)
  end

  def update
      @user = User.find(params[:id])
      @user = current_user
      if @user.update(user_params)
          flash[:notice] = "You have updated user succeessfully."
          redirect_to user_path(@user)
      else
          render :edit
      end
  end

  def destroy
   @book = Book.find(params[:id])
   @book.destroy
   redirect_to book_path
  end

  private

  def user_params
    params.require(:user).permit(:name,:introduction,:profile_image)
  end



end