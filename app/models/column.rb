class Column < ApplicationRecord
	has_many :column_images, dependent: :destroy
    accepts_nested_attributes_for :column_images
    accepts_attachments_for :column_images, attachment: :column_images
	validates :title, presence: true
	validates :body, presence: true, length: {maximum: 1000}

end