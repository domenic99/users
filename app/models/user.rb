#
# @model User
#
# @property user_id(required)    [string]   UUID for the user's ID
# @property name  [string]    the name for user
# @property email(required)   [string]   user's email address
#
class User < ActiveRecord::Base
  include ActiveUUID::UUID

  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true

  def to_hash
    {
      user_id: self.user_id,
      name: self.name,
      email: self.email
    }
  end
end
