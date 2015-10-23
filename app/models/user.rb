# == Schema Information
#
# Table name: users
#
#  id                 :integer          not null, primary key
#  first_name         :string
#  last_name          :string
#  email              :string
#  encrypted_password :string
#  access_token       :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class User < ActiveRecord::Base
  include Authenticator

  validates :email, presence: true, uniqueness: true
  validate :validate_password_presence
  validate :validate_password_length

  has_many :categories
  has_many :tips
  has_many :tags
  has_many :comments

  after_commit :update_cache

  def self.find_by_credentials(creds)
    user = self.find_by_email(creds[:email])
    user if user.present? && user.valid_password?(creds[:password])
  end

  private

  def update_cache
    if $redis.set("#{self.class.table_name}/#{self.id}", self.to_json) == "OK"
      true
    else
      false
    end
  end

  def set_access_token
    self.update_attribute(:access_token, SecureRandom.urlsafe_base64(20).tr('lIO0', 'sxyz'))
    self.update_cache
  end

  def destroy_token
    self.reload
    self.update_attribute(:access_token, nil)
    self.update_cache
  end
end
