# == Schema Information
#
# Table name: likes
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  author_id  :bigint           not null
#  post_id    :bigint           not null
#
# Indexes
#
#  index_likes_on_author_id  (author_id)
#  index_likes_on_post_id    (post_id)
#
# Foreign Keys
#
#  fk_rails_...  (author_id => users.id)
#  fk_rails_...  (post_id => posts.id)
#
class Like < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  belongs_to :post, class_name: 'Post', foreign_key: :post_id
  after_save :update_likes_counter

  def self.ransackable_attributes(_auth_object = nil)
    %w[created_at updated_at author_id post_id]
  end

  def self.ransackable_associations(_auth_object = nil)
    %w[author post author_id post_id comment comment_id]
  end

  private

  def update_likes_counter
    post.increment!(:likes_counter)
  end
end
