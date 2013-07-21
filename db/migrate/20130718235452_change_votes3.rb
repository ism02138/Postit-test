class ChangeVotes3 < ActiveRecord::Migration
  def change
    change_table :votes do |t|
      t.references :voteable, polymorphic: true
    end
  end
end
