class Post < ApplicationRecord

  has_many_attached :images
  belongs_to :user

  with_options presence: true do
    validates :title
    validates :article
    validates :place
    validates :user_id
  end

end
