class DestinationsController < ApplicationController
    def show
        @destination = Destination.find(params.require(:id))

        @featured_post = @destination.posts.sort{|post| post.likes}.last

        ages = @destination.bloggers.uniq.map {|blogger| blogger.age}
        @average_age = ages.reduce(:+) / ages.count
        
        @most_recent = @destination.posts.sort{|post| post.created_at}[-1...-5]
    end
end