# == Schema Information
#
# Table name: categories
#
#  id      :integer          not null, primary key
#  user_id :integer
#  name    :string
#

class Category < ActiveRecord::Base
  include Elasticsearch::Model
  include Cacheable

  settings index: { number_of_shards: 1 } do
    mappings do
      indexes :name
      indexes :created_at
    end
  end

  has_many :articles, dependent: :destroy
  validates :name, uniqueness: true
end


