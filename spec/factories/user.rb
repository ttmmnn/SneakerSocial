FactoryBot.define do
  factory :user do
    name { Faker::Lorem.characters(number:10) }
    email { Faker::Internet.email }
    introduction { Faker::Lorem.characters(number: 30) }
    password { 'password' }
    password_confirmation { 'password' }

    after(:build) do |user|
      user.profile_image.attach(io: File.open('spec/images/noimage.png'),filename: 'default-image.png',content_type: 'image/png')
    end
  end
end