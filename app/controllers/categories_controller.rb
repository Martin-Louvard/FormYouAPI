class CategoriesController < ApplicationController
    before_action :set_category, only: [:show, :update, :destroy]
    before_action :authenticate_admin, only: [:create, :update, :destroy]

    def index
      @categories = Category.all
  
      render json: @categories
    end
  
    def show
      render json: @category
    end
  
    def create
      @category = Category.new(category_params)
  
      if @category.save
        render json: @category, status: :created, location: @category
      else
        render json: @category.errors, status: :unprocessable_entity
      end
    end
  
    def update
      if @category.update(category_params)
        render json: @category
      else
        render json: @category.errors, status: :unprocessable_entity
      end
    end
  
    def destroy
      @category.destroy
    end
  
    private
      def set_category
        @category = Category.find(params[:id])
      end
  
      def category_params
        params.require(:category).permit(:title)
      end
end
