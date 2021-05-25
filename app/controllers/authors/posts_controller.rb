module Authors
  class PostsController < AuthorsController
    POSTS_PER_PAGE = 6
    before_action :set_post, only: [:edit, :update, :destroy, :published, :unpublished]
  
    # GET /posts
    def index
      @page = params.fetch(:page, 0).to_i
      @posts = current_author.posts.most_recently_published.paginate(:page => params[:page], :per_page => 3).includes(:likes)
    end


    # GET /posts/new
    def new
      @post = Post.new
    end
  
    # GET /posts/1/edit
    def edit
      @element = @post.elements.build
    end

    def published
      @post.update(published: true, publish_date: Time.now)
      redirect_to root_path
    end

    def unpublished
      @post.update(published: false, publish_date: nil)
      redirect_to root_path
    end
  
    # POST /posts
    def create
      @post = current_author.posts.new(post_params)
  
      if @post.save
        redirect_to edit_post_path(@post)
        return
      end
    end
  
    # PATCH/PUT /posts/1
    def update
      if @post.update(post_params)
        redirect_to edit_post_path(@post)
      else
        render :edit
      end
    end
  
    # DELETE /posts/1
    def destroy
      @post = current_author.posts.find(params[:id])
      if @post.present?
        @post.destroy
        
      end
      redirect_to posts_url, notice: 'Post was successfully destroyed.'
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_post
        @post = current_author.posts.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through.
      def post_params
        params.require(:post).permit(:title, :description, :header_image, :published, :tag_list)
      end
  end
end


