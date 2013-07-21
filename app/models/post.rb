class Post < ActiveRecord::Base
	has_many :comments
	has_many :post_categories
	has_many :categories, through: :post_categories
  has_many :votes, as: :voteable
  
	belongs_to :creator, class_name: 'User', foreign_key: :user_id

	validates :title, presence: true
	validates :description, presence: true

  after_validation :generate_slug

  def total_votes
    total = self.votes.where(vote: true).size - self.votes.where(vote: false).size
    #total > 0 ? total : 0
  end

  def generate_slug
    self.slug = self.title.gsub(' ', '-').downcase
  end

  def to_param
    self.slug
  end

end
