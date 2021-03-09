class ClassroomsController < ApplicationController
    before_action :set_classroom, only: [:show, :update, :destroy]
    before_action :authenticate_admin, only: [:create, :update, :destroy]
    before_action :user_is_approved

    def index
      @classrooms = Classroom.all
  
      render json: @classrooms
    end
  
    def show
      render json: @classroom
    end
  
    def create
      @classroom = Classroom.new(classroom_params)
  
      if @classroom.save
        render json: @classroom, status: :created, location: @classroom
      else
        render json: @classroom.errors, status: :unprocessable_entity
      end
    end
  
    def update
      if @classroom.update(classroom_params)
        render json: @classroom
      else
        render json: @classroom.errors, status: :unprocessable_entity
      end
    end
  
    def destroy
      @classroom.destroy
    end
  
    private
      def set_classroom
        @classroom = Classroom.find(params[:id])
      end
  
      def classroom_params
        params.require(:classroom).permit(:title)
      end
end
