class BooksController < ApplicationController

  def index

  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)

    if @book.save
      flash[:notice] = 'Success'
      redirect_to book_path(@book)
    else
      flash.now[:notice] = 'Error'
      render :new
    end
  end

  private
  def book_params
    params.require(:book).permit(:title, :author, :year, :description, :category)
  end
end
