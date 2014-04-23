class Comment < ActiveRecord::Base
  validates :body, :user_id, :commentable_type, :commentable_id, presence: true
  validates :commentable_type, inclusion: { in: ['User', 'Contact'] }

  belongs_to :commentable, polymorphic: true
end