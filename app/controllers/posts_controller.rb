class PostsController < ApplicationController
  before_action :set_post
  def show
    begin
      impressionist(@post)
    rescue
      puts('not recorded')
    end
    @views = @post.impressionist_count
    @uniq_views = @post.impressionist_count(:filter=>:ip_address)
  end

  def set_post
    @post = Post.friendly.find(params[:id])
  end
end