FactoryBot.define do
  factory :user do
    nickname {'テスト'}
    last_name {'太郎'}
    last_name_kana {'タロウ'}
    first_name {'山田'}
    first_name_kana {'ヤマダ'}
    email {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 6)
    password {password}
    password_confirmation {password}
    birthday {'2000-01-02'}
  end
end