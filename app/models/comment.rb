class Comment < ActiveRecord::Base
  belongs_to :author, class_name: "User"
  belongs_to :commentable, polymorphic: true
  has_many :votes, as: :votable

  validates_presence_of :body, :author_id, :commentable_id, :commentable_type

  include Postable
end
