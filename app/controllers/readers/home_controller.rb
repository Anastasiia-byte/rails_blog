
module Readers
  class HomeController < ReadersController
    def index
      @post = Post.published.most_recently_published
    end
  end
end
