class Article < ActiveRecord::Base
  attr_accessible :title, :text, :author_id
  belongs_to :author

  default_scope { order(created_at: :desc) }
end
