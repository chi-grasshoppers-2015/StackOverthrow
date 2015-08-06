class Comment < ActiveRecord::Base
  belongs_to :author, class_name: "User"
  belongs_to :commentable, polymorphic: true
  has_many :votes, as: :votable, dependent: :destroy

  validates_presence_of :body, :author_id, :commentable_id, :commentable_type

  include Postable

  def find_redirect_route
    if self.commentable_type == "Question"
      return "/questions/#{self.commentable_id}"
    else
      return "/questions/#{self.commentable.question.id}"
    end
  end

end
