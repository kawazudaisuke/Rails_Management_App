class User < ApplicationRecord
    validates :content, presence: true
    validates :start, presence: true
    validates :end, presence: true
end
