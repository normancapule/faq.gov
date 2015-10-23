# == Schema Information
#
# Table name: tags
#
#  id         :integer          not null, primary key
#  article_id :integer
#  user_id    :integer
#  name       :string
#

class Tag < ActiveRecord::Base
  belongs_to :user
  belongs_to :comment
end

