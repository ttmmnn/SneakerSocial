# frozen_string_literal: true

require 'rails_helper'

describe '投稿のテスト' do
  let!(:post) { create(:post,title:'hoge',body:'body') }
  describe 'トップ画面(root_path)のテスト' do
    before do
      visit root_path
    end
    context '表示の確認' do
       it 'トップ画面(root_path)に投稿一覧ページへのリンクが表示されているか' do
        expect(page).to have_link "", href: posts_path
       end
    end
  end
    
end