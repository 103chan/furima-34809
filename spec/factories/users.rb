FactoryBot.define do
  factory :user do
    nickname              { 'test' }
    family_name           { '手簀戸' }
    first_name            { '太郎' }
    family_name_kana      { 'テスト' }
    first_name_kana       { 'タロウ' }
    email                 { 'test@example' }
    password              { '000aaa' }
    password_confirmation { password }
    birthday              { '1986-01-01' }
  end
end
