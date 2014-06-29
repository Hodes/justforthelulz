class Author < ActiveRecord::Base
  has_many :articles

  has_attached_file :avatar, :styles => { :thumb => '48x48' }, :default_url => '/images/:style/missing.png'
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end
