class ChangeVotes2 < ActiveRecord::Migration
  def change
    remove_column :votes, :voteable_id
  end
end
