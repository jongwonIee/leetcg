module Readers
  class HomeController < ReadersController
    def index
      @q = Post.order(id: :desc).ransack(params[:q])
      @pagy, @posts = pagy(@q.result, items: 6)

      respond_to do |format|
        format.html
        format.json {
          render json: { entries: render_to_string(partial: "posts", formats: [:html]), pagination: view_context.pagy_nav(@pagy)
          }
        }
      end
    end
  end
end
