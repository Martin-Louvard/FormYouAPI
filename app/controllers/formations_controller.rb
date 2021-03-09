class FormationsController < ApplicationController
    before_action :set_formation, only: [:show, :update, :destroy]
    before_action :authenticate_admin, only: [:create, :update, :destroy]
  
    def index
      @formations = Formation.all
  
      render json: @formations
    end
  
    def show
      render json: @formation
    end
  
    def create
      @formation = Formation.new(formation_params)
  
      if @formation.save
        render json: @formation, status: :created, location: @formation
      else
        render json: @formation.errors, status: :unprocessable_entity
      end
    end
  
    def update
      if @formation.update(formation_params)
        render json: @formation
      else
        render json: @formation.errors, status: :unprocessable_entity
      end
    end
  
    def destroy
      @formation.destroy
    end
  
    private
      def set_formation
        @formation = Formation.find(params[:id])
      end
  
      def formation_params
        params.require(:formation).permit(:title, :content)
      end
  
  end