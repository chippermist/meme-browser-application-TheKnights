module PostsHelper
	def tag_links(tags)
		tags.split(",").map{|tag| link_to tag.strip, tag_path(tag.strip) }.join(", ") 
	end
	
	def user_ownes_post?(post)
		return current_user == post.user 
	end

  def cache_key_for_post(post)
    "post/#{post.id}/#{post.updated_at}"
  end

  def cache_key_for_posts_table
    ("posts_table/#{Post.maximum(:updated_at)}/"
    + Comment.maximum(:updated_at).to_s)
  end
end
