# == Schema Information
#
# Table name: categories
#
#  id      :integer          not null, primary key
#  user_id :integer
#  name    :string
#

class Category < ActiveRecord::Base
  has_many :articles, dependent: :destroy
  validates :name, uniqueness: true

  def as_json options={}
    super options.merge(include: :articles)
  end
end


