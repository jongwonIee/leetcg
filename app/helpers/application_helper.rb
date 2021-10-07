module ApplicationHelper
  include Pagy::Frontend
  # def current_order
  #   # Use Find by id to avoid potential erros
  #   if Order.find_by_id(session[:order_id]).nil?
  #     Order.new
  #   else
  #     Order.find_by_id(session[:order_id])
  #   end
  # end
  #
  def current_order
    if session[:order_id].nil? && author_signed_in? && current_author.orders != []
      #if there is no command and the user is logged in and user already has a current command
      Order.find(session[:order_id] = current_author.orders.last.id)
    elsif !session[:order_id].nil? && author_signed_in? && current_author.orders != [] && current_author.orders.last.id != session[:order_id]
      #if there is a current command and the user is logged in and the user already has a command and the id of his command is different from the id of the session
      current_author.orders.last.order_items += Order.find(session[:order_id]).order_items
      Order.find(session[:order_id]).destroy!
      Order.find(session[:order_id] = current_author.orders.last.id)
    elsif !session[:order_id].nil? && author_signed_in? && current_author.orders == [] && Order.find(session[:order_id]).author_id.nil?
      #if there is a current command and the user is logged in and the user has no command and the command does not have user_id
      pan = Order.find(session[:order_id])
      pan.author_id = current_author.id
      pan.save
      Order.find(session[:order_id])
    elsif !session[:order_id].nil?
      #if there is no user login but there is a command
      Order.find(session[:order_id])
    else
      Order.new
    end
  end

end
