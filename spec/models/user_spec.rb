require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    it 'メール、パスワード、ユーザーネームがある場合、登録できる' do
      user = build(:user)
      expect(user).to be_valid
    end
  
    it 'ユーザーネームがない場合登録できない' do
      user = build(:user, username: nil)
      user.valid?
      expect(user.errors[:username]).to include("can't be blank")
    end
  
    it 'emailがなければ登録できない' do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end
  
    it 'パスワードがなければ登録できない' do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end
  end
end