class ReviewsController < ApplicationController

  #レビュー投稿
  def create
    @review = Review.create(params_review)
    redirect_to classroom_path(@review.classroom.id)
  end

  private
    def params_review
      params.require(:review).permit(:classroom_id, :user_id, :comment, :rate, :title)
    end
end

