class FormationsessionsController < ApplicationController
    before_action :set_formationsession, only: [:show, :update, :destroy]
    before_action :authenticate_admin, only: [:create, :update, :destroy]
    before_action :user_is_approved
  
  
    def index
      @formationsessions = Formationsession.all
  
      render json: @formationsessions
    end
  
    def show
      render json: @formationsession
    end
  
    def create
      @formationsession = Formationsession.new(formationsession_params)
  
      if @formationsession.save
        render json: @formationsession, status: :created, location: @formationsession
      else
        render json: @formationsession.errors, status: :unprocessable_entity
      end
    end
  
    def update
      if @formationsession.update(formationsession_params)
        render json: @formationsession
      else
        render json: @formationsession.errors, status: :unprocessable_entity
      end
    end
  
    def destroy
      @formationsession.destroy
    end
  
    private
      def set_formationsession
        @formationsession = Formationsession.find(params[:id])
      end
  
      def formationsession_params
        params.require(:formationsession).permit(:title)
      end
  
  end