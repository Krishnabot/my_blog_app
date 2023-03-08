require 'rails_helper'
RSpec.describe 'User', type: :feature do
  before(:each) do
    @user = User.create(
      name: 'Kiploman',
      bio: 'Graphic designer',
      photo: 'http://hello.com/org.png',
      posts_counter: 0
    )
  end
  describe 'show page' do
    it "has users's username." do
      visit "/users/#{@user.id}"
      expect(page).to have_content(@user.name)
    end
    it "has users's bio." do
      visit "/users/#{@user.id}"
      expect(page).to have_content(@user.bio)
    end
    it 'should have the profile picture' do
      visit "/users/#{@user.id}"
      expect(page).to have_content(@user.photo)
    end
    it 'has link to all posts' do
      visit "/users/#{@user.id}"
      expect(page).to have_link('See all posts')
    end
    it 'has recent three posts' do
      visit "/users/#{@user.id}"
      expect(page).to have_selector('.user-no-of-posts', count: 1)
    end
    it 'has users number of posts' do
      visit "/users/#{@user.id}"
      expect(page).to have_content("Number of posts: #{@user.posts_counter}")
    end
  end
end
