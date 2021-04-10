FactoryBot.define do
  factory :user do
    nickname              { 'test' }
    family_name           { '手簀戸' }
    first_name            { '太郎' }
    family_name_kana      { 'テスト' }
    first_name_kana       { 'タロウ' }
    email                 {Faker::Internet.free_email}
    password              { '000aaa' }
    password_confirmation { password }
    birthday              { '1986-01-01' }
  end
end
