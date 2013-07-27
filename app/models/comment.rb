class Comment < ActiveRecord::Base

  include VoteableIsm

#  has_many :votes, as: :voteable
  
	belongs_to :creator, class_name: 'User', foreign_key: :user_id
	belongs_to :post

  def total_votes
    total = self.votes.where(vote: true).size - self.votes.where(vote: false).size
  end
end
