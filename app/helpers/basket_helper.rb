module BasketHelper
  def basket_items
    session[:basket_items] ||= {}
  end

  def basket_item_count(product_id)
    session[:basket_items][product_id.to_s].present? ? session[:basket_items][product_id.to_s]["quantity"] : 0
  end

  def basket_item_subtotal(product_id)
    product_id = product_id.to_s
    product = Product.find product_id
    if product && session[:basket_items][product_id].present?
      product.cost * session[:basket_items][product_id]["quantity"]
    else
      Money.new(0)
    end
  end

  def basket_total_cost
    session[:basket_items].keys.reduce(Money.new(0)) { |total, product_id| total += basket_item_subtotal(product_id) }
  end
end
