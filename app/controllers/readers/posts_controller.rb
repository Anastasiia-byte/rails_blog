module Readers
    class PostsController < ReadersController
    
        

        def show
            @post = Post.published.find(params[:id])
            @comment = Comment.new

            @comments = @post.comments
        end
    end
end