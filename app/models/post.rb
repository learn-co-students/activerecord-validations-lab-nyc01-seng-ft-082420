class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
    validate :is_clickbait?

    CLICKBAIT_PATTERNS = [/Won't Believe/, /Secret/, /Top/, /Guess/]

    def is_clickbait?
        if CLICKBAIT_PATTERNS.none? { |p| p.match title }
          errors.add(:title, "must be clickbait")
        end
      end


end
