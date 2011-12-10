class PostsController < ApplicationController
  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.published

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find(params[:id])
    @og_url = post_url( @post )
    @og_desc = @post.get_teaser
    @og_type = "article"
    @title = "Blog: " + @post.title

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end
  end

  # RSS/Atom feed
  def feed
    @posts = Post.published

    respond_to do |format|
      format.rss { render :layout => false } #index.rss.builder
    end
  end
end
