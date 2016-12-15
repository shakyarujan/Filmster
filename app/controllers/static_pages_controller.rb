class StaticPagesController < ApplicationController
    def index
        @movies = Movie.all
        @reviews = Review.all
    end
    
end
