class ReviewsController < ApplicationController
  before_action :get_review, only: [:show, :edit]

  def index
    @reviews = Review.all
  end

  def show
  end

  private

  def get_review
    @review = Review.find(params[:id])
  end

end
