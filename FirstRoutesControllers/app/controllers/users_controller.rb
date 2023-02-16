# app/controllers/users_controller.rb

class UsersController < ApplicationController
    def index
        @users = User.all
        render json: @users
    end

    def create
        user = User.new(user_params)
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
      @user = User.find(params[:id])
      render json: @user
    end

    def update
      @user = User.find(params[:id])

      if @user.update(user_params)
          redirect_to user_url(@user.id)
      else
          render json: @user.errors.full_messages, status: :unprocessable_entity
      end
    end

    def destroy
      @user = User.find(params[:id])
      if @user.destroy #delete vs destroy - destroy removes dependent whereas delete only that row
        render json: "User destroyed"
      else
        render json: @user.errors.full_messages, status: :unprocessable_entity
      end
    end

    private 
    def user_params
      # debugger
      params.require(:user).permit(:username) #params[:chirp] => {body: "My new"}
    end
end
