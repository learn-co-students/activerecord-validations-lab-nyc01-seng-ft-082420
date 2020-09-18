class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {
  minimum: 250
  }
  validates :summary, length: {
  maximum: 250
  }
  validates :category, inclusion: { in: [ "Fiction", "Non-Fiction"] }
  # validates :id, :created_at, :updated_at, absence: true
end
