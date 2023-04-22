FactoryBot.define do
    factory :user do
      id {1}
      email {"test@user.com"}
      password {"qwerty"}
      # Add additional fields as required via your User model
    end

    factory :user2 do
      id {2}
      email {"test1@user.com"}
      password {"qwerty"}
      # Add additional fields as required via your User model
    end
end