class AddUserToBlorghPost < ActiveRecord::Migration
  def change
    add_column :blorgh_posts, :user_id, :integer, references: :users
  end
end
