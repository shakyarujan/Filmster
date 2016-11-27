class StaticPagesController < ApplicationController
    def index
    
    end
    
    def create    
        @StaticPage = StaticPage.create(StaticPage_params)
        if @StaticPage.valid?
          flash[:success] = "Your StaticPage has been posted!"
        else
          flash[:alert] = "Woops! Looks like there has been an error!"
        end
        redirect_to root_path
    end
    
    def edit
        @StaticPage = StaticPage.find(params[:id])
    end
    
    def update
        @StaticPage = StaticPage.find(params[:id])
        if @StaticPage.update(StaticPage_params)
          flash[:success] = "The StaticPage has been updated!"
          redirect_to root_path
        else
          flash[:alert] = "Woops! Looks like there has been an error!"
          redirect_to edit_StaticPage_path(params[:id])
        end
    end
    
    def destroy
        @StaticPage = StaticPage.find(params[:id])
        @StaticPage.destroy
        flash[:success] = "The StaticPage was successfully deleted!"
        redirect_to root_path
    end
    private
    def staticpage_params
        params.require(:StaticPage).permit(:username)
    end
end
