module Authors
    class LikesController < AuthorsController
        before_action :find_post 
        before_action :find_like, only: [:destroy]

        def create
            if already_liked?
                flash[:notice] = "You can't like more than once"
            else
                @post.likes.create(author_id: current_author.id)
            end
            redirect_to blog_post_path(@post)
        end  

        def destroy
            if !(already_liked?)
            flash[:notice] = "Cannot unlike"
            else
            @like.destroy
            end
            redirect_to blog_post_path(@post)
        end

        def find_like
            @like = @post.likes.find(params[:id])
        end
        
        private  
        
        def already_liked?
            Like.where(author_id: current_author.id, post_id: params[:post_id]).exists?
        end

        def find_post
            @post = Post.find(params[:post_id])
        end
    end
end
