class Store < ApplicationRecord
  belongs_to :category
  has_many :menus, dependent: :destroy
end
