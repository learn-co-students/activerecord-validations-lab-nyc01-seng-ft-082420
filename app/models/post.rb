class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w{Fiction Non-Fiction} }
    validate :is_click_bait

    def is_click_bait
        believe = false
        secret = false
        top = false
        guess = false
        if self.title
            if self.title.include?("Won't Believe")
                believe = true
            end
            if self.title.include?("Secret")
                secret = true
            end
            if self.title.include?("Top /[\d+]/")
                top = true
            end
            if self.title.include?("Guess")
                guess = true
            end
            if !(believe || secret || top || guess)
                self.errors.add(:title, "Title isn't click-baity enough sry")
            end
        end
    end
end

