class AddCommentAncestry < ActiveRecord::Migration
  def change
    create_table :comment_ancestries do |t|
      t.integer :ancestor_id
      t.integer :descendant_id
      t.timestamps
    end
  end
end
