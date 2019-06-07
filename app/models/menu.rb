class Menu < ApplicationRecord
  #belongs_to :category
  belongs_to :store
  has_many :buckets, dependent: :destroy
end
