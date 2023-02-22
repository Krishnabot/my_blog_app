class Post < ApplicationRecord
    has_many :comments, foreign_key: 'post_id'
    has_many :likes
    belongs_to :user, class_name: 'User'
    after_create :update_counter

    def upadate_countr 
        if !user.posts_countr 
            user.posts_counter = 1
            user.save 
        else
            user.posts_counter +=1
            user.save
        end
    end


end
