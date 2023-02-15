# app/controllers/users_controller.rb

class UsersController < ApplicationController
    def index
        render plain: "I'm in the index action!"
    end


    def create
        render json: params #['some_category']
    end

    def show
        render json: params
    end

end
