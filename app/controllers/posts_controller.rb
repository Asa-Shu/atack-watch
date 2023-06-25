class PostsController < ApplicationController
    before_action :set_post, only: [:edit, :update, :destroy]

    def index
      if params[:search]
        # @posts = Post.where("title LIKE ? AND deleted = false", "%#{params[:search]}%")
        @posts = Post.where("title like '%#{params[:search]}%' AND deleted = false")
      else
        @posts = Post.where(deleted: false)
      end
    end

    def new
        @post = Post.new
    end

    def create
        @post = Post.new(post_params)

        if @post.save
            redirect_to posts_path
        else
            render :new
        end
    end

    def edit
    end

    def update
        if @post.update(post_params)
            redirect_to posts_path
        else
            render :edit
        end
    end

    def destroy
        @post.update(deleted: true)
        redirect_to posts_path
    end

    private

    def post_params
        params.require(:post).permit(:title, :content)
    end

    def set_post
        @post = Post.find(params[:id])
    end
end
