class Answer < ActiveRecord::Base
  belongs_to :author, class_name: "User"
  belongs_to :question
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :votes, as: :votable, dependent: :destroy

  validates_presence_of :author_id, :question_id, :body

  include Postable

end
