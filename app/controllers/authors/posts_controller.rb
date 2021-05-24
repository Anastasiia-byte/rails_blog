module Authors
  class PostsController < AuthorsController
    POSTS_PER_PAGE = 6
    before_action :set_post, only: [:edit, :update, :destroy]
  
    # GET /posts
    def index
      @page = params.fetch(:page, 0).to_i
      @posts = Post.most_recently_published.paginate(:page => params[:page], :per_page => 2)
    end


    # GET /posts/new
    def new
      @post = current_author.posts.build
    end
  
    # GET /posts/1/edit
    def edit
      @element = @post.elements.build
    end
  
    # POST /posts
    def create
      @post = current_author.posts.build(post_params)
  
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
      @post = Post.find(params[:id])
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
        params.permit(:title, :description, :header_image, :published)
      end
  end
end


