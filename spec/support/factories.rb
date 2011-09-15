FactoryGirl.define do
  factory :user do
    provider 'twitter'
    uid  '37'
    admin false
  end

  factory :post do
    title 'Hello'
    content 'Hello World'
  end
  
  factory :comment do
    content "Hello World"
  end
end