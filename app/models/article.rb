class Article < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged

  belongs_to :author

  default_scope { order(created_at: :desc) }
end
