module Authors
  class PostsController < AuthorsController
    before_action :set_post, only: [:edit, :update, :destroy]

    # GET /posts
    def index
      # @posts = current_author.posts
      @q = Post.order(id: :desc).ransack(params[:q])
      @pagy, @posts = pagy(@q.result, items: 20)
    end

    # GET /posts/new
    def new
      @posts = @q.result
    end

    # GET /posts/1/edit
    def edit
      @element = @post.elements.build
    end

    # POST /posts
    def create
      @post = current_author.posts.build(post_params)

      if @post.save
        redirect_to edit_post_path(@post)
      else
        redirect_to new_post_path(@post)
      end
    end

    # PATCH/PUT /posts/1
    def update
      if @post.update(post_params)
        redirect_to edit_post_path(@post)
      else
        redirect_to edit_post_path(@post)
      end
    end

    # DELETE /posts/1
    def destroy
      @post.order_items.destroy_all
      @post.destroy
      redirect_to posts_url
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_post
        @post = current_author.posts.friendly.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def post_params
        params.require(:post).permit(:title, :code, :price, :language, :condition, :stock, :in_stock, :description, :hashtag, :header_image)
      end
  end
end