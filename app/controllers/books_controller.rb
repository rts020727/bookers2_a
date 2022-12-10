class BooksController < ApplicationController
  def index
    @books = Book.all
    @book = Book.new
    @user = current_user.id
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to books_path
  end

  def show
    @book_new = Book.new
    @book = Book.find(params[:id])
    @user = @book.user
  end

  def edit
  end
  
  private
  
  def book_params
    params.require(:book).permit(:title, :body, :image)
  end
end
