class Post < ApplicationRecord
  validates :title, presence: true, length: { maximum: 30 }
  validates :image, presence: true
  validates :user_id, {presence: true}
  belongs_to :user
  has_many :comments, foreign_key: 'post_id', dependent: :destroy
  

  mount_uploader :image, ImageUploader

  def user
    return User.find_by(id: self.user_id)
  end

  acts_as_taggable

end
