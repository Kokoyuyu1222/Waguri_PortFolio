class Column < ApplicationRecord
	belongs_to :fermer
	has_many :column_images, dependent: :destroy
    accepts_attachments_for :column_images, attachment: :image
	validates :title, presence: true
	validates :body, presence: true, length: {maximum: 1000}

end