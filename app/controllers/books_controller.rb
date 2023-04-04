class BooksController < ApplicationController
  protect_from_forgery
  def index
    @user = current_user
    @books = Book.all
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
  end

  def create
   @book =Book.new(book_params)
   @book.user_id = current_user.id

   if @book.save
    redirect_to book_path(@book.id)
   else
     @user = current_user
     @books = Book.all
    render :index

   end
  end


  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
