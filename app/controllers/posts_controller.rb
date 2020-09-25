class PostsController < ApplicationController
    
    def index 
        @posts = Post.all
    end

    def new 
        @post = Post.new 
    end
    def create 
        post = Post.create(post_params)
        if post.valid?

            redirect_to post_path
        else
            flash[:my_errors] = post.errors.full_messages
            redirect_to new_post_path
        end
    end

    private

    def post_params
        params.require(:post).permit(:title, :content, :summary, :category)
    end
end
