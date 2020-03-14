require 'rails_helper'

RSpec.describe User, type: :model do

  describe '#create' do

    context "can save" do
      it "is valid with a nickname, email, password, password_cofirmation" do
        expect(build(:user)).to be_valid
      end
    end

    context "cannot save" do

      it "is invalid without a nickname" do
        user = build(:user, nickname: nil)
        user.valid?
        expect(user.errors[:nickname]).to include("を入力してください")
      end

      it "is invalid without a password" do
        user = build(:user, password: nil)
        user.valid?
        expect(user.errors[:password]).to include("が入力されていません。")
      end

      it "is invalid with that password_confirmation is defferent to password" do
        user = build(:user, password: "00000000", password_confirmation: "11111111")
        user.valid?
        expect(user.errors[:password_confirmation]).to include("と新しいパスワードの入力が一致しません")
      end


      it "is invalid with a dupulicate email" do
        user = create(:user, email: "ooo@gmail")
        another_user = build(:user, email: "ooo@gmail")
        another_user.valid?
        expect(another_user.errors[:email]).to include("は既に使用されています。")
      end

    end





  end
end