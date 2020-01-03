class PostsController < ApplicationController
    before_action :get_post, only: [:show, :like]
    
    def index
        @posts = Post.all
    end

    def show

    end

    def new
        @post = Post.new
    end

    def create
        @post = Post.new(post_params)
        byebug
        @post.likes = 0

        if @post.valid?
            @post.save
            redirect_to post_path(@post)
        else
            render :new
        end
    end

    def like
        @post.likes += 1
        @post.save
        redirect_to post_path(@post)
    end

    def edit

    end

    def update
        post_params.each do |attribute, value|
            @post.send("#{attribute}", value)
        end

        if @post.valid?
            @post.save
            redirect_to post_path(@post)
        else
            render :edit
        end
    end

    private

    def get_post
        @post = Post.find(params.require(:id))
    end

    def post_params
        params.require(:post).permit(:title, :content, :destination_id, :blogger_id)
    end
end