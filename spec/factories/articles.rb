FactoryBot.define do
  factory :article do
    title { "MyString" }
    body { "MyText" }
    association :journalist, factory: :user
  end
end
