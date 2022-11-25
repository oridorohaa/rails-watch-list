class ReviewsController < ApplicationController
  
  before_action :set_list, only: :create

  def create
    @review = Review.new(review_path)
    @review.list = @list
    if @review.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  private

  def review_path
    params.require(:review).permit(:comment, :stars)
  end

  def set_list
    @list = List.find(params[:list_id])
  end
end
