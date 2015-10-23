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
  include Elasticsearch::Model
  include Cacheable

  settings index: { number_of_shards: 1 } do
    mappings do
      indexes :title
      indexes :content
      indexes :tags
      indexes :created_at
    end
  end

  belongs_to :category
  has_many :comments, dependent: :destroy
  has_many :tags, dependent: :destroy
  has_many :tips, dependent: :destroy

  after_destroy :remove_cache

  def as_json options={}
    super options.merge(include: :category)
  end
end

