class Post < ApplicationRecord

  has_many_attached :images
  belongs_to :user
  has_many :comments

  with_options presence: true do
    validates :title
    validates :article
    validates :place
    validates :user_id
  end

end
