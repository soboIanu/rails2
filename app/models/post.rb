class Post < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :content, presence: true
end
