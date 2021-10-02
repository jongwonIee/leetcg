module Readers
  class HomeController < ReadersController
    def index

      user_agent = 'Mozilla/5.0 (Windows NT 6.2; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/30.0.1599.17 Safari/537.36'
      client = DeviceDetector.new(user_agent)
      @smartphone = client.device_type

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
