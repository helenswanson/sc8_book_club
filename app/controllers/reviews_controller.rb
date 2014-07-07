class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
    @book = Book.find(params[:book_id])
    @review.book = @book

    if @review.save
      flash[:notice] = 'Success'
      redirect_to book_path(@book)
    else
      flash.now[:notice] = 'Error'
      render 'books/show'
    end
  end

  private
  def review_params
    params.require(:review).permit(:rating, :body)
  end
end
