require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    context "新規登録ができる時" do
      it '全ての項目を埋めれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordとpassword_confirmationが6文字以上であれば登録できる' do
        @user.password = "111aaa"
        expect(@user).to be_valid
      end
      it "passwordとpassword_confirmationの値が同じであれば登録できる" do
        @user.password = "111aaa"
        @user.password_confirmation = "111aaa"
        expect(@user).to be_valid
      end
    end
    context "新規登録ができない時" do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが半角英数字混合での入力でなければ登録できない" do
        @user.password = "111111"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
      end
      it 'family_nameが空では登録できない' do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it "family_nameが全角（漢字.ひらがな. カタカナ)でなければ登録できない"do
        @user.family_name = "nomoto"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name に全角文字を使用してください")
      end
      it "first_nameが全角（漢字.ひらがな. カタカナ)でなければ登録できない"do
        @user.first_name = "nomoto"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name に全角文字を使用してください")
      end
      it 'family_name_kanaが空では登録できない' do
        @user.family_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana can't be blank")
      end
      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it "family_name_kanaが全角カナでなければ登録できない" do
        @user.family_name_kana = "のもと"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana に全角カナを使用してください")
      end
      it "first_name_kanaが全角カナでなければ登録できない" do
        @user.first_name_kana = "のもと"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana に全角カナを使用してください")
      end
      it 'birth_dayが空では登録できない' do
        @user.birth_day = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth day can't be blank")
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '000aa'
        @user.password_confirmation = '000aa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it "emailに@マークがなければ登録できない" do
        @user.email = "aaaa.icloud.com"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "passwordとpassword_confirmationの値が同じでなければ登録できない" do
        @user.password = "111aaa"
        @user.password_confirmation = "111bbb"
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
    end
  end
end
