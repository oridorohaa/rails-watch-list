class ListsController < ApplicationController

  before_action :set_bookmark, only: :show
  before_action :set_review, only: :show

  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end


  private

  def list_params
    params.require(:list).permit(:name, :photo)
  end

  def set_bookmark
    @bookmark = Bookmark.new
  end

  def set_review
    @review = Review.new
  end
end
