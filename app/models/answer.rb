class Answer < ActiveRecord::Base
  belongs_to :author, class_name: "User"
  belongs_to :question
  has_many :comments, as: :commentable
  has_many :votes, as: :votable

  validates_presence_of :author_id, :question_id, :body, :best_answer, :created_at, :updated_at

  include Postable
end
