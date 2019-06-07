class Bucket < ApplicationRecord
	belongs_to :menu, required: false
	belongs_to :store, required: false
	#belongs_to :category

end
