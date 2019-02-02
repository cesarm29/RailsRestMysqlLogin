class CategoriesController < ApplicationController 
  before_action :set_category, only: [:show, :update, :destroy] 
  def index 
    @categories = Category.all 
    render json: @categories 
  end
  def create 
    @category = Category.new(category_params) 
    if @category.save 
      render json: { success: true, category_id: @category.id } 
    else 
      render json: { success: false } 
    end 
  end 
  def update 
    if @category.update(category_params) 
      render json: { success: true } 
    else 
      render json: { success: false } 
    end 
  end 
  def show 
    render json: @category 
  end 
  def destroy 
    if @category.destroy 
      render json: { success: true } 
    else 
      render json: { success: false } 
    end 
  end 
  private 
  def set_category 
    @category = Category.find(params[:id]) 
  end 
  def category_params 
    params.require(:category).permit(:name) 
  end 
end