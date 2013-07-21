class ChangeVotes < ActiveRecord::Migration
  def change
    remove_column :votes, :voteable_type, :voteable_id
    remove_column :votes, :voteable_id
  end
end
