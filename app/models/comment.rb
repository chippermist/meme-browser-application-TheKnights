class Comment < ApplicationRecord
	belongs_to :commentable, polymorphic: true
	belongs_to :user, optional: true
	has_many :comments, as: :commentable

	acts_as_votable

	def post
		commentable.is_a?(Post) ? commentable : commentable.post
	end
end
