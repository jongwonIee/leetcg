module Readers
  class HomeController < ReadersController
    def index
      @q = Post.order(id: :desc).ransack(params[:q])
      @pagy, @posts = pagy(@q.result, items: 9)
    end
  end
end
