class User < ActiveRecord::Base
  validates :username, presence: true, uniqueness: true

  has_many :direct_contacts,
            class_name: "Contact",
            foreign_key: :user_id,
            primary_key: :id

  has_many :contact_shares
  has_many :shared_contacts, through: :contact_shares, source: :contact
  has_many :comments, as: :commentable
end