# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe '実際に保存してみる' do
    it '有効な投稿内容の場合は保存されるか' do
      expect(FactoryBot.build(:comment)).to be_valid
    end
  end
  context '空白のバリデーションチェック' do
    it 'commentが空白の場合にバリデーションチェックされ、作成されないか' do
      comment = Comment.new(comment_content: '')
      expect(comment).to be_invalid
    end
  end
  describe 'アソシエーションのテスト' do
    context 'userモデルとの関係' do
      it 'N:1となっている' do
        expect(Comment.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end
    context 'postモデルとの関係' do
      it 'N:1となっている' do
        expect(Comment.reflect_on_association(:post).macro).to eq :belongs_to
      end
    end
  end
end