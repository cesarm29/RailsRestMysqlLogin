class LoginController < ApplicationController
    before_action :set_login, only: [:show, :update, :destroy] 
    def index 
      @login = Login.all 
      render json: @login 
    end
    def create 
      @login = Login.new(login_params) 
      if @login.save 
        render json: { success: true, login_id: @login.id } 
      else 
        render json: { success: false } 
      end 
    end 
    def update 
      if @login.update(login_params) 
        render json: { success: true } 
      else 
        render json: { success: false } 
      end 
    end 
    def show 
      render json: @login 
    end 
    def destroy 
      if @login.destroy 
        render json: { success: true } 
      else 
        render json: { success: false } 
      end 
    end 
    private 
    def set_login 
      @login = Login.find(params[:username][:password]) 
    end 
    def login_params 
      params.require(:login).permit(:username) 
    end 
  end
