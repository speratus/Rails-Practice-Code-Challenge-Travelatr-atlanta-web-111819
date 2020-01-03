class BloggersController < ApplicationController
    def show
        @blogger = Blogger.find(params.require(:id))
        @total_likes = @blogger.posts.map {|post| post.likes}.reduce(:+)
        @featured_post = @blogger.posts.sort {|post| post.likes}.last
    end
end