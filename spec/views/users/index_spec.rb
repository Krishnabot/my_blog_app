require 'rails_helper'

RSpec.describe 'User', type: :system do
  describe 'index page' do
    before :each do
    @user = User.create(
      name: 'John',
      bio: 'Software Developer',
      photo: 'http://hello1.com/org.png',
      posts_counter: 0
    )
      visit '/users'
    end
    it 'shows the username of all users' do
      expect(page).to have_content(@user.name)
    end

    it 'shows profile picture of each user' do
      expect(page).to have_content(@user.photo)
    end

    it 'shows the number of posts each user has written' do
      expect(page).to have_content("Number of posts: #{@user.posts_counter}")
    end

    it 'should redirect to users show page' do
      visit users_path(@user.id)
      click_on 'show user', match: :first
      expect(page).to have_current_path user_path([@user.id])
    end
  end
end
