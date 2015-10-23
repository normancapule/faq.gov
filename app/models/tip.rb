# == Schema Information
#
# Table name: tips
#
#  id         :integer          not null, primary key
#  article_id :integer
#  user_id    :integer
#  content    :text
#

class Tip < ActiveRecord::Base
  belongs_to :article
  belongs_to :user

  validates_presence_of :content
end


