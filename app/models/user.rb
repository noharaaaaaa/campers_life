class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :first_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
    validates :last_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
    validates :first_name_kana, format: { with: /\A[ァ-ヶー]+\z/ }
    validates :last_name_kana, format: { with: /\A[ァ-ヶー]+\z/ }
  end

  has_one_attached :profile_image
  has_many :posts
  has_many :comments

end
