FactoryBot.define do
  factory :order_address do
    post_code      { '000-0000' }
    prefecture_id  { 2 }
    city           { 'てすと'}
    address        { 'テスト'}
    telephone      { '12345678901' }
    token          {"tok_abcdefghijk00000000000000000"}
  end

end
