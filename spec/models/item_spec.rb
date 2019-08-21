require 'rails_helper'
describe Item do
  describe '#create' do
    it "nameが空の場合、登録できない" do
      item = build(:item, name: "")
      item.valid?
      expect(item.errors[:name]).to include("を入力してください")
    end

    it "全項目が適切に入力されている場合（factories/items.rb参照）、登録できる" do
      item = build(:item)
      item.valid?
      expect(item).to be_valid
    end
  end
end