class Blogger < ApplicationRecord
    validates :name, uniqueness: true
    validates :bio, length: {minimum: 30}
    validates :age, numericality: {greater_than: 0}
    
    has_many :posts
    has_many :destinations, through: :posts

    
end
