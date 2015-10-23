# == Schema Information
#
# Table name: articles
#
#  id          :integer          not null, primary key
#  category_id :integer
#  title       :text
#  content     :text
#

class Article < ActiveRecord::Base
  belongs_to :category
  has_many :comments, dependent: :destroy
  has_many :tags, dependent: :destroy
  has_many :tips, dependent: :destroy

end

