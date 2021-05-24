
module Readers
  class HomeController < ReadersController
    def index
      if params[:tag].present?
        @page = params.fetch(:page, 0).to_i
        @posts = Post.most_recently_published.tagged_with(params[:tag]).paginate(:page => params[:page], :per_page => 3)
      else
        @page = params.fetch(:page, 0).to_i
        @posts = Post.most_recently_published.paginate(:page => params[:page], :per_page => 3)
        
      end
  end

    
  

  end
end
