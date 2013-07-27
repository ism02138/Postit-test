module VoteableIsm
  def self.included(base)
    base.send(:include, InstanceMethods)
    base.extend ClassMethods
    base.class_eval do
      my_class_method
    end
  end

  module InstanceMethods
    def total_votes
      self.votes.where(vote: true).size - self.votes.where(vote: false).size
    end

    def generate_slug
      self.slug = self.description.gsub(' ', '-')
    end
  end

  module ClassMethods
    def my_class_method
      has_many :votes, as: :voteable
    end
  end
end
