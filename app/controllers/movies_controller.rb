class MoviesController < ApplicationController
    def show 
        @movie = Movie.includes(:reviews, reviews: :user).find_by(imdbid: params[:id])
    end 
end
