class Vote < ActiveRecord::Base
  belongs_to :voter, class_name: "User"
  belongs_to :votable, polymorphic: true

  validates_presence_of :voter_id, :votable_id, :votable_type, :value

  def tally(post)
    post.votes.map(:value).reduce(:+)
  end
end
