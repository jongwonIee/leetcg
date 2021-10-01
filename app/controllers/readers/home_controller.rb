module Readers
  class HomeController < ReadersController
    def index
      @q = Post.ransack(params[:q])
      @pagy, @posts = pagy(@q.result, items: 9)
      # @posts = Post.published.most_recently_published
    end
  end
end
