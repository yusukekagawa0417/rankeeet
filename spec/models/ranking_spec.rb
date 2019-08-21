require 'rails_helper'
describe Ranking do
  describe '#create' do
    it "nameが空の場合、登録できない" do
      ranking = build(:ranking, name: "")
      ranking.valid?
      expect(ranking.errors[:name]).to include("を入力してください")
    end
  
    it "nameが既に存在する場合、登録できない" do
      ranking = create(:ranking, name: "好きなスポーツ")
      ranking = build(:ranking, name: "好きなスポーツ")
      ranking.valid?
      expect(ranking.errors[:name]).to include("はすでに存在します")
    end

    it "全項目が適切に入力されている場合（factories/rankings.rb参照）、登録できる" do
      ranking = build(:ranking)
      ranking.valid?
      expect(ranking).to be_valid
    end
  end
end