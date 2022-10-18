class BasketController < ApplicationController
  def index
    @basket_items = Product.where(id: session[:basket_items].keys)
  end

  def create
    if session[:basket_items][params[:id]].present?
      session[:basket_items][params[:id]]["quantity"] += 1 
    else
      session[:basket_items][params[:id]] = { "quantity" => 1 }
    end
  end

  def destroy
    if session[:basket_items].present? && 
      session[:basket_items][params[:id]].present? && 
      session[:basket_items][params[:id]]["quantity"] > 1
      session[:basket_items][params[:id]]["quantity"] -= 1
    else
      session[:basket_items].delete(params[:id])
    end
  end
end