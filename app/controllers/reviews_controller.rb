class ReviewsController < ApplicationController
  before_action :get_review, only: [:show, :edit]

  def index
    @reviews = Review.all
  end

  def show
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    if @review.save
      redirect_to review_path(@review)
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:id, :title, :body, :fresh)
  end

  def get_review
    @review = Review.find(params[:id])
  end


end
