class Author < ActiveRecord::Base
  has_many :articles

  authenticates_with_sorcery!

  has_attached_file :avatar, :styles => { :small => '128x128>', :thumb => '48x48>' }, :default_url => '/images/:style/missing.png'
  validates_attachment :avatar, :content_type => { :content_type => ["image/jpeg", "image/gif", "image/png"] }
  validates :email, uniqueness: true, on: :create
  validates :password, length: { minimum: 3 }, on: :create
end
