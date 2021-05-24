
module Readers
  class HomeController < ReadersController
    def index
      @post = Post.published.most_recently_published.paginate(:page => params[:page], :per_page => 2)
    end
  end
end
