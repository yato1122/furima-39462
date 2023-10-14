class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :first_name, presence: true, format: { with: /\p{Hiragana}+|\p{Katakana}+|[\p{Han}\p{Hiragana}\p{Katakana}]+/ }
  validates :first_name, presence: true, format: { with: /\p{Hiragana}+|\p{Katakana}+|[\p{Han}\p{Hiragana}\p{Katakana}]+/ }
  validates :password,
            format: { with: /\A(?=.*[A-Za-z])(?=.*\d)/, message: 'must include at least one letter and one digit' }
  validates :last_name, presence: true, format: { with: /\p{Hiragana}+|\p{Katakana}+|[\p{Han}\p{Hiragana}\p{Katakana}]+/ }
  validates :first_name_kana, presence: true, format: { with: /\p{Katakana}+/ }
  validates :last_name_kana, presence: true, format: { with: /\p{Katakana}+/ }
  validates :birthday, presence: true
end
