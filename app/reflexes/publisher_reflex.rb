# frozen_string_literal: true

class PublisherReflex < ApplicationReflex
 
  def publish
    post = Post.find(element.dataset[:post_id])
    post.update(published: true, publish_date: Time.now)
  end

  def unpublish
    post = Post.find(element.dataset[:post_id])
    post.update(published: false, publish_date: nil)
  end

end
