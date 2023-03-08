require 'rails_helper'

RSpec.describe 'Post', type: :system do
  describe 'Index page' do
    before :each do
      @user = User.create(name: 'Tom',
                          bio: 'Teacher from Mexico.',
                          photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                          posts_counter: 0)

      @post = Post.create(title: 'Hello',
                          text: 'This is my first post',
                          comments_counter: 0,
                          likes_counter: 0,
                          user: @user)

      visit "/users/#{@user.id}/posts"
    end

    it 'Should display the  profile picture of the user' do
      expect(page).to have_content(@user.photo)
    end

    it 'Should display name of the user' do
      expect(page).to have_content(@user.name)
    end

    it 'Should display  the number of posts the user has posted' do
      expect(page).to have_content("Number of posts: #{@user.posts_counter}")
    end

    it 'Should display the post title' do
      expect(page).to have_content(@post.title)
    end

    it 'Should display some of the post body' do
      expect(page).to have_content(@post.text)
    end

    it 'Should display the first comments of a post' do
      @comments = @post.five_most_recent_comments
      @comments.each do |comment|
        expect(page).to have_content(comment.text)
      end
    end

    it 'Should display the number of comments of a post' do
      expect(page).to have_content(@post.comments_counter)
    end

    it 'Should Display how many likes a post have' do
      expect(page).to have_content(@post.likes_counter)
    end

    it 'Should display  a section of pagination' do
      expect(page).to have_content('Pagination')
    end

    it 'Should redirect to the posts show page when clicked' do
      click_on(@post.text)
      expect(page).to have_current_path("/users/#{@user.id}/posts/#{@post.id}")
    end
  end
end
