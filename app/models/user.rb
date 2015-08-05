class User < ActiveRecord::Base
  has_many :questions, foreign_key: :author_id
  has_many :answers, foreign_key: :author_id
  has_many :comments, foreign_key: :author_id
  has_many :votes, foreign_key: :voter_id

  validates_presence_of :username, :email, :hashed_password, :created_at, :updated_at
  validates_uniqueness_of :username, :email
end
