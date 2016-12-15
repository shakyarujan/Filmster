class ReviewsController < ApplicationController
  before_action :authenticate_user!, only: :create  
  
 
  def create
    @movie = MovieBuilder.new(imdbid: params[:imdbid]).build!
    # create a new review and connect it to the current_user and the movie
    @review = current_user.reviews.new(review_params.merge(movie: @movie))

    if @review.save
      flash[:success] = "Review saved!"
      redirect_to root_path
    else
      flash[:alert] = "Woops! It seems there was an error."
      redirect_to root_path
    end
    
  end
  
  def destroy
    @review = current_user.reviews.find(params[:id])
    @movie = @review.movie 
    if @review.destroy
      flash[:danger] = "Review deleted!"
    end
    redirect_to :back
  end
  
  private

  def review_params
    params.require(:review).permit(:comment)
  end
end