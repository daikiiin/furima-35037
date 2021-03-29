require 'rails_helper'

RSpec.describe Item, type: :model do
    before do
      @item = FactoryBot.build(:item)
    end

    describe '投稿した商品の情報' do
      context '商品が投稿できる場合' do
        it '全ての項目を埋めれば投稿できる' do
          expect(@item).to be_valid
        end
      end
      context '商品が投稿できない場合' do
        it '出品画像が空では投稿できない' do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Image can't be blank")
        end 
        it "商品名が空では投稿できない" do
          @item.name = ""
          @item.valid?
          expect(@item.errors.full_messages).to include("Name can't be blank")
        end
        it "商品の説明がなければ投稿できない" do
          @item.explain = ""
          @item.valid?
          expect(@item.errors.full_messages).to include("Explain can't be blank")
        end
        it "カテゴリーの情報がなければ投稿できない" do
          @item.category_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Category を選択して下さい")
        end
        it "商品の状態についての情報がなければ投稿できない" do
          @item.item_status_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Item status を選択して下さい")
        end
        it "配送料の負担についての情報がなければ投稿できない" do
          @item.shipping_fee_status_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Shipping fee status を選択して下さい")
        end
        it "発送元の地域についての情報がなければ投稿できない" do
          @item.shipping_fee_destination_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Shipping fee destination を選択して下さい")
        end
        it "発送までの日数についての情報がなければ投稿できない" do
          @item.shipping_fee_day_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Shipping fee day を選択して下さい")
        end
        it "販売価格についての情報がなければ投稿できない" do
          @item.cost = ""
          @item.valid?
          expect(@item.errors.full_messages).to include("Cost can't be blank")
        end
        it "販売価格は半角数字でなければ投稿できない" do
          @item.cost = "３９９"
          @item.valid?
          expect(@item.errors.full_messages).to include("Cost is not a number")
        end
        it "販売価格が300未満だと投稿できない" do
          @item.cost = 299
          @item.valid?
          expect(@item.errors.full_messages).to include("Cost must be greater than or equal to 300")
        end
        it "販売価格が9999999より大きいと投稿できない" do
          @item.cost = 10000000
          @item.valid?
          expect(@item.errors.full_messages).to include("Cost must be less than or equal to 9999999")
        end
        it "販売価格は半角英数混合では投稿できない" do
          @item.cost = "123aaa"
          @item.valid?
          expect(@item.errors.full_messages).to include("Cost is not a number")
        end
        it "販売価格は半角英語では投稿できない" do
          @item.cost = "aaaa"
          @item.valid?
          expect(@item.errors.full_messages).to include("Cost is not a number")
        end
       it 'ユーザーが紐付いていなければ投稿できない' do
          @item.user = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("User must exist")
      end
    end
  end
end
