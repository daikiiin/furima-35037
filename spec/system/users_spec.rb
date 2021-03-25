# require 'rails_helper'

# RSpec.describe 'ユーザー新規登録', type: :system do
#   before do
#     @user = FactoryBot.build(:user)
#   end
#   context 'ユーザー新規登録ができるとき' do 
#     it '正しい情報を入力すればユーザー新規登録ができてトップページに移動する' do
#       # トップページに移動する
#       visit root_path
#       # トップページにサインアップページへ遷移するボタンがあることを確認する
#       expect(page).to have_content('新規登録')
#       # 新規登録ページへ移動する
#       visit new_user_registration_path
#       # ユーザー情報を入力する
#       fill_in 'nickname', with: @user.nickname
#       fill_in 'email', with: @user.email
#       fill_in 'password', with: @user.password
#       fill_in 'password confirmation', with: @user.password_confirmation
#       fill_in 'last-name', with: @user.family_name
#       fill_in 'first-name', with: @user.first_name
#       fill_in 'last-name-kana', with: @user.family_name_kana
#       fill_in 'first-name-kana', with: @user.first_name_kana
#       select(value = "1930", from: "user[birth_day(1i)]") 
#       # サインアップボタンを押すとユーザーモデルのカウントが1上がることを確認する
#       # トップページへ遷移したことを確認する
#       # カーソルを合わせるとログアウトボタンが表示されることを確認する
#       # サインアップページへ遷移するボタンや、ログインページへ遷移するボタンが表示されていないことを確認する
#     end
#   end
#   context 'ユーザー新規登録ができないとき' do
#     it '誤った情報ではユーザー新規登録ができずに新規登録ページへ戻ってくる' do
#       # トップページに移動する
#       # トップページにサインアップページへ遷移するボタンがあることを確認する
#       # 新規登録ページへ移動する
#       # ユーザー情報を入力する
#       # サインアップボタンを押してもユーザーモデルのカウントは上がらないことを確認する
#       # 新規登録ページへ戻されることを確認する
#     end
#   end
# end