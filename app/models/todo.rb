class Todo < ApplicationRecord
	# validates :name, presence: true
	# validates :description, presence: true
	validates_presence_of :name, :description
end