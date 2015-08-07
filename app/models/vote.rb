class Vote < ActiveRecord::Base
  belongs_to :voter, class_name: "User"
  belongs_to :votable, polymorphic: true

  validates_presence_of :voter_id, :votable_id, :votable_type, :value

  def self.tally(post)
    votes_values = post.votes.map { |vote| vote.value}
    votes_values.reduce(:+) || 0
  end
end
