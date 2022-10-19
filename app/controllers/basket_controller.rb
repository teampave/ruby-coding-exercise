class BasketController < ApplicationController
  def index
    @basket_items = Product.where(id: session[:basket_items].keys)
  end

  def create
    @product = Product.find params[:id]

    if session[:basket_items][params[:id]].present?
      session[:basket_items][params[:id]]["quantity"] += 1 
    else
      session[:basket_items][params[:id]] = { "quantity" => 1 }
    end

    update_item_counters
  end

  def destroy
    @product = Product.find params[:id]

    if session[:basket_items].present? && 
      session[:basket_items][params[:id]].present? && 
      session[:basket_items][params[:id]]["quantity"] > 1
      session[:basket_items][params[:id]]["quantity"] -= 1
    else
      session[:basket_items].delete(params[:id])
    end

    update_item_counters
  end

  private

  def update_item_counters
    render turbo_stream: [
      turbo_stream.update("basket_items_counter", partial: "shared/basket"),
      turbo_stream.update("product_#{params[:id]}", partial: "basket/item_breakdown", locals: { product: @product }),
      turbo_stream.update("basket_total", partial: "basket/total")
    ]
  end
end