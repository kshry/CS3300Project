FactoryBot.define do
    factory :user do
      id {101}
      email {"test@user.com"}
      password {"qwerty"}
      # Add additional fields as required via your User model
    end

    factory :user2, class: User do
      id {102}
      email {"test2@user.com"}
      password {"qwerty"}
      # Add additional fields as required via your User model
    end

    factory :user3, class: User do
      id {103}
      email {"test4@user.com"}
      password {"qwerty"}
      # Add additional fields as required via your User model
    end
end