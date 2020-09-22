class Post < ActiveRecord::Base


    validates :title , presence: true 
    validates :content , length: {minimum: 250}
    validates :summary , length: {maximum: 250 }
    validates :size , inclusion: {in: %w(Fiction Non-Fiction)}
    
end
