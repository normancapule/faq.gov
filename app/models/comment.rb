# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  comment_id :integer
#  article_id :integer
#  content    :text
#

class Comment < ActiveRecord::Base
  belongs_to :article
  belongs_to :user
  belongs_to :comment
  has_many :comments
end


