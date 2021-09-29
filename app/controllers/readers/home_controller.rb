module Readers
  class HomeController < ReadersController
    def index
      @q = Post.ransack(params[:q])
      @posts = @q.result
      # @posts = Post.published.most_recently_published
    end
  end
end
