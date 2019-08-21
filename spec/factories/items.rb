FactoryBot.define do
  factory :item do
    name      {"野球"}
    association :ranking
  end
end