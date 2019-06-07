class Category < ApplicationRecord
	has_many :stores, dependent: :destroy
	#has_many :menus, dependent: :destroy
	#belongs_to :bucket
end