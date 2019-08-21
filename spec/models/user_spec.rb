require 'rails_helper'
describe User do
  describe '#create' do
    it "nameが空の場合、登録できない" do
      user = build(:user, name: "")
      user.valid?
      expect(user.errors[:name]).to include("を入力してください")
    end
  
    it "nameが既に存在する場合、登録できない" do
      user = create(:user, name: "kagawa")
      user = build(:user, name: "kagawa")
      user.valid?
      expect(user.errors[:name]).to include("はすでに存在します")
    end

    it "emailが空の場合、登録できない" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end
  
    it "emailが既に存在する場合、登録できない" do
      user = create(:user, email: "kkk@gmail.com")
      user = build(:user, email: "kkk@gmail.com")
      user.valid?
      expect(user.errors[:email]).to include("はすでに存在します")
    end

    it "passwordが空の場合、登録できない" do
      user = build(:user, password: "")
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end
  
    it "passwordが5文字以下の場合、登録できない" do
      user = build(:user, password: "00000")
      user.valid?
      expect(user.errors[:password]).to include("は6文字以上で入力してください")
    end

    it "passwordが6文字以上の場合、登録できる" do
      user = build(:user, password: "000000")
      user.valid?
      expect(user).to be_valid
    end

    it "全項目が適切に入力されている場合（factories/users.rb参照）、登録できる" do
      user = build(:user)
      user.valid?
      expect(user).to be_valid
    end
  end
end