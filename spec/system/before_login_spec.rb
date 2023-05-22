# frozen_string_literal: true

require 'rails_helper'

describe 'ユーザログイン前のテスト' do
  describe 'トップ画面のテスト' do
    before do
      visit root_path
    end

    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/'
      end
      it '「ゲストログインで試す」リンクが表示されているか？' do
        expect(page).to have_link "", href: users_guest_sign_in_path
      end
      it '「ユーザー登録」リンクが表示されているか？' do
        expect(page).to have_link "", href: new_user_registration_path
      end
      it '「ログイン」リンクが表示されているか？' do
        expect(page).to have_link "", href: new_user_session_path
      end
    end
  end

   describe 'アバウト画面のテスト' do
     before do
       visit '/about'
     end

     context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/about'
      end
     end
   end

   describe 'ヘッダーのテスト: ログインしていない場合' do
     before do
      visit root_path
    end
  end
end