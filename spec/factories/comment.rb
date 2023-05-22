FactoryBot.define do
  factory :comment do
    comment_content { Faker::Lorem.characters(number:10) }
    user
    post
  end
end