require 'rails_helper'
RSpec.describe 'Index page', type: :feature do
    before(:each) do
        @user = User.create(
          name: 'John',
          bio: 'Software Developer',
          photo: 'http://hello1.com/org.png',
          posts_counter: 0
        )
        @user_two = User.create(
          name: 'Victor',
          bio: 'Graphic designer',
          photo: 'http://hello1.com/org.png',
          posts_counter: 0
        )
        visit "/users"
      end
      describe 'index page' do
        it 'shows the right content' do
          expect(page).to have_content('John')
          expect(page).to have_content('Victor')
        end
        it 'should have the profile picture' do
            expect(page).to have_content(@user.photo)
            expect(page).to have_content(@user_two.photo)
        end
        it 'should redirect to users show page' do
            visit users_path(@user.id)
            click_on 'show user', match: :first
            expect(page).to have_current_path user_path([@user.id])
        end
      end

end