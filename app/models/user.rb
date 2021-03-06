class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :purchases

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください' 
  validates :nickname, presence: true
  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥々]/, message: 'に全角文字を使用してください' } do
    validates :family_name
    validates :first_name
  end
  with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: "に全角カナを使用してください"} do
    validates :family_name_kana, presence: true
    validates :first_name_kana, presence: true
  end
  validates :birth_day, presence: true
end
