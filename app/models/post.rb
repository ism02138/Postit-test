class Post < ActiveRecord::Base
	has_many :comments
	has_many :post_categories
	has_many :categories, through: :post_categories
	belongs_to :creator, class_name: 'User', foreign_key: :user_id

	validates :user_id, presence: true
	validates :title, presence: true
	validates :url, presence: true
	validates :description, presence: true
end