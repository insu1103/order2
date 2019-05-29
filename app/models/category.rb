class Category < ApplicationRecord
	has_many :stores, dependent: :destroy
end
