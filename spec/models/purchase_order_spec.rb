require 'rails_helper'

RSpec.describe PurchaseOrder, type: :model do
  before do
    @user = FactoryBot.build(:user)
    @item = FactoryBot.build(:item)
    @purchase_order = FactoryBot.build(:purchase_order, user_id: @user.id, item_id: @item.id)
  end
  describe '購入情報の保存' do
    context "商品購入ができる時" do
      it '全ての項目を埋めれば登録できる' do
        @purchase_order.user_id = "1"
        @purchase_order.item_id = "1"
        expect(@purchase_order).to be_valid
      end
      it '建物名の欄が空白でも購入できる' do
        @purchase_order.user_id = "1"
        @purchase_order.item_id = "1"
        @purchase_order.building_name = ""
        expect(@purchase_order).to be_valid
      end
    end
    context "商品購入ができない時" do
      it '郵便番号が空では登録できない' do
        @purchase_order.post_code = ''
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("Post code can't be blank")
      end
      it '都道府県が空では登録できない' do
        @purchase_order.shipping_fee_destination_id = 1
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("Shipping fee destination を選択して下さい")
      end
      it '市町村村が空では登録できない' do
        @purchase_order.city = ''
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空では登録できない' do
        @purchase_order.address = ''
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が空では登録できない' do
        @purchase_order.phone_number = ""
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("Phone number can't be blank")
      end
      it "郵便番号にハイフンがなければ登録できない"do
        @purchase_order.post_code = "1234567"
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("Post code を正しく入力してください")
      end
      it '電話番号が全角数字では登録できない' do
        @purchase_order.phone_number = "０９０１２３４５６７８"
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("Phone number に数字を使用してください")
      end
      it '電話番号が英語では登録できない' do
        @purchase_order.phone_number = "asdfghjkkkk"
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("Phone number に数字を使用してください")
      end
      it '電話番号が12桁以上では登録できない' do
        @purchase_order.phone_number = "080000000000"
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("Phone number に数字を使用してください")
      end
      it "tokenが空では登録できないこと" do
        @purchase_order.token = nil
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("Token can't be blank")
      end
      it "user_idが空では登録できないこと" do
        @purchase_order.user_id = ""
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("User can't be blank")
      end
      it "item_idが空では登録できないこと" do
        @purchase_order.item_id = ""
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
