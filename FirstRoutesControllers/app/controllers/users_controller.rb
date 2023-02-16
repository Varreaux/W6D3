# app/controllers/users_controller.rb

class UsersController < ApplicationController
    def index
        @users = User.all
        render json: @users
    end

    def create
        user = User.new(params.require(:user).permit(:name, :email))
        if user.save
          render json: user
        else
          render json: user.errors.full_messages, status: :unprocessable_entity
        end
    end

    # def create
    #     render json: params #['some_category']
    # end

    def show
        render json: params
    end

end
