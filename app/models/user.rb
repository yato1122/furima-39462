class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, presence: true
  validates :first_name, presence: true, format: { with: /\A[\p{Han}\p{Hiragana}\p{Katakana}ー]+\z/ }
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
  validates :password, format: { with: VALID_PASSWORD_REGEX, message: 'must include at least one letter and one digit' }
  validates :last_name, presence: true, format: { with: /\A[\p{Han}\p{Hiragana}\p{Katakana}ー]+\z/ }
  validates :first_name_kana, presence: true, format: { with: /\p{Katakana}+/ }
  validates :last_name_kana, presence: true, format: { with: /\p{Katakana}+/ }
  validates :birthday, presence: true

  has_many :items
  has_many :orders
end
