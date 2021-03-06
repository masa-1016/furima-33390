class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_many :histories

  with_options presence: true do
    validates :nickname, :birthday

    with_options format: { with: /\A[ぁ-んァ-ン一-龥々ー]+\z/ } do
      validates :last_name, :first_name
    end

    with_options format: { with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/ } do
      validates :last_name_kana, :first_name_kana
    end
  end
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX
end
