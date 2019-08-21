FactoryBot.define do
  factory :ranking do
    name      {"好きなスポーツ"}
    association :user
  end
end