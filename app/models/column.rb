class Column < ApplicationRecord
	belongs_to :fermer
	has_many :column_comments, dependent: :destroy
	has_many :column_favorites, dependent: :destroy
	# has_many :column_favorite_columns, through: :column_favorites, source: :column
	has_many :column_images, dependent: :destroy
    accepts_attachments_for :column_images, attachment: :image
	validates :title, presence: true
	validates :body, presence: true, length: {maximum: 1000}

	def favorited_by?(consumer)
          column_favorites.where(consumer_id: consumer.id).exists?
    end
end
