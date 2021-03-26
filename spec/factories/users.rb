FactoryBot.define do
  factory :user do
    nickname              {'test'}
    family_name           {'てすと'}
    first_name            {'てすと'}
    family_name_kana      {'テスト'}
    first_name_kana       {'テスト'}
    email                 {'test@example'}
    password              {'000aaa'}
    password_confirmation {password}
    birthday              {'1986-01-01'}
  end
end