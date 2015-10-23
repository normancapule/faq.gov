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
end


