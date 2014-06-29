class Author < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation

  has_many :articles

  authenticates_with_sorcery!

  has_attached_file :avatar, :styles => { :thumb => '48x48' }, :default_url => '/images/:style/missing.png'
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  validates :email, uniqueness: true
  validates :password, length: { minimum: 3 }
end
