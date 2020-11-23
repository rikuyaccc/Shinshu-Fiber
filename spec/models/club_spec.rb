require 'rails_helper'

RSpec.describe Club, type: :model do
  describe '#create' do
    it '名前とプロフィールがあれば登録できる' do
      club = build(:club)
      expect(club).to be_valid
    end
    it '名前がなければ登録できない' do
      club = build(:club, name: nil)
      club.valid?
      expect(club.errors[:name]).to include("can't be blank")
    end
  
    it 'プロフィールがなければ登録できない' do
      club = build(:club, profile: nil)
      club.valid?
      expect(club.errors[:profile]).to include("can't be blank")
    end
  
    it '名前は重複してはならない' do
      club1 = create(:club, name: "name")
      club2 = build(:club, name: club1.name)
      club2.valid?
      expect(club2.errors[:name]).to include("has already been taken")
    end
  end
end