class ContactShare < ActiveRecord::Base
  validates :contact_id, :user_id, presence: true
  validates_uniqueness_of :user_id, scope: [:contact_id]

  belongs_to :user
  belongs_to :contact
end