class Post < ActiveRecord::Base
    # include ActiveModel::Validations
    # validates_with CategoryValidator
    validates :title, presence: true
    validates :content, {:length => {:minimum => 20}}
    validates :summary, {:length => {:maximum => 200}}
    # validates :category, inclusion: { in: %w(post tag image update)}
    #validate :is_clickbait?
    
end


# CLICKBAIT_PATTERNS = [
#     /Won't Believe/i,
#     /Secret/i,
#     /Top [0-9]*/i,
#     /Guess/i
#   ]

#   def is_clickbait?
#     if CLICKBAIT_PATTERNS.none? { |pat| pat.match title }
#       errors.add(:title, "must be clickbait")
#     end
#   end