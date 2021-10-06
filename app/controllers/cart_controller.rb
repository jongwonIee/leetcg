class CartController < ApplicationController
  def show
    @order_items = current_order.order_items
    @q = Post.order(id: :desc).ransack(params[:q])
    @pagy, @posts = pagy(@q.result, items: 6)
  end
end
