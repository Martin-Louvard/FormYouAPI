class ParticipationsController < ApplicationController
    before_action :set_user
    before_action :authenticate_user!
    before_action :user_is_approved
    before_action :set_participation, only: [:show, :update, :destroy]
    before_action :check_if_allowed
  
    def index
      @participations = @user.participations
  
      render json: @participations
    end
  
    def show
      render json: @participation
    end
  
    def create
  
      @participation = Participation.new(participation_params)
      @participation.student = current_user
  
      if @participation.save
        render json: @participation, status: :created, location: url_for([@user, @participation])
      else
        render json: @participation.errors, status: :unprocessable_entity
      end
    end
  
    def update
      if @participation.update(participation_params)
        render json: @participation
      else
        render json: @participation.errors, status: :unprocessable_entity
      end
    end
  
    def destroy
      @participation.destroy
    end
  
    private
      def set_participation
        @participation = Participation.find(params[:id])
      end
  
      def set_user
        @user = User.find(params[:user_id])
      end
  
      def participation_params
        params.require(:participation).permit(:user_id, :note, :promotion)
      end
  
      def check_if_allowed
        unless current_user == @user || current_user.role === "admin"
          render json: {success: false, error: "You can't see this page"}, status: 401
        end
      end
end
