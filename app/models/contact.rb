class Contact < ActiveRecord::Base
  validates :name, :email, :user_id, presence: true
  validates :user_id, uniqueness: true

  belongs_to :user
  has_many :contact_shares
  has_many :shared_users, through: :contact_shares, source: :user
  has_many :comments, as: :commentable

  def self.contacts_for_user_id(user_id)
    find_by_sql([<<-SQL, user_id: user_id])
    SELECT DISTINCT contacts.*
    FROM contacts
    LEFT OUTER JOIN contact_shares ON contact_shares.contact_id = contacts.id
    WHERE contacts.user_id = :user_id OR contact_shares.user_id = :user_id
    SQL
  end
end