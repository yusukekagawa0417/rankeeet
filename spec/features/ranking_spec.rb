require 'rails_helper'

feature 'ランキング作成ボタンを押下', type: :feature do
  let(:user) { create(:user) }

  scenario '①未ログイン時はログインページに遷移、②ログインするとランキング作成ページに遷移、③ランキング作成' do
    # 未ログイン時にランキング作成ボタンを押すとログインページに遷移
    visit root_path
    click_on('ランキング作成')
    expect(current_path).to eq new_user_session_path

    # emailとpasswordを入力しクリックするとランキング作成ページに遷移
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    find('input[type="submit"]').click
    expect(current_path).to eq new_ranking_path

    # ランキングの作成
    expect {
      fill_in 'ranking_name', with: '好きなスポーツ'
      find('input[type="submit"]').click
    }.to change(Ranking, :count).by(1)
  end
end


