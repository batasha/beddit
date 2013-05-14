class CommentAncestry < ActiveRecord::Base
  attr_accessible :ancestor_id, :descendant_id

  belongs_to :ancestor, :class_name => "Comment"
  belongs_to :descendant, :class_name => "Comment"

  def self.create_ancestry(ancestor, comment)
    CommentAncestry.create!(ancestor_id: ancestor.id,
                            descendant_id: comment.id)

    return if ancestor.parent_id.nil?

    CommentAncestry.create_ancestry(ancestor.parent, comment)
  end
end
