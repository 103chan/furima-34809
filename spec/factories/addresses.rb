FactoryBot.define do
  factory :address do
    post_code      { '000-0000' }
    prefecture_id  { 2 }
    city           { 'てすと'}
    address        { 'テスト'}
    building       { 'テスト'}
    telephone      { 00000000000 }
  end
end
