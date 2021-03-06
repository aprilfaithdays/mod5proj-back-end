class WorkoutsController < ApplicationController
    def index
        workouts = Workout.all
        render json: workouts, except: [:created_at, :updated_at], include: [:user]
    end

    def show
        workout = Workout.find(params[:id])
        render json: workout, except: [:created_at, :updated_at], include: [:user]
    end

    def create
        workout = Workout.create(workout_params)
        render json: workout, except: [:created_at, :updated_at],include: [:user], status: 201
    end

    def update
        workout = Workout.find_by(id: params[:id])
        workout.update(workout_params)
        render json: workout, except: [:created_at, :updated_at], include: [:user], status: 201
    end

    def destroy
        workout = Workout.find_by(id: params[:id])
        workout.destroy
    end

    private

    def workout_params
        params.require(:workout).permit(:user_id, :name, :duration, :description, :media)
    end
end
