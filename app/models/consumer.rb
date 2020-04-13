class Consumer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable
  has_many :cart_products, dependent: :destroy
  has_many :destinations, dependent: :destroy
  has_many :orders, dependent: :destroy

  has_many :column_comments, dependent: :destroy
  has_many :column_comment_columns,through: :column_comments, source: 'column'

  has_many :product_comments, dependent: :destroy
  has_many :product_comment_products,through: :product_comments, source: 'product'

  has_many :column_favorites, dependent: :destroy
  # has_many :column_favorite_columns, through: :column_favorites, source: 'column'

  enum withdraw: { draft: false, published: true }
  enum gender: { man: 0, woman: 1 }
  enum age: { ten: 0,twenty: 1,thirty: 2, forty: 3,fifty: 4}

  def favorited_by?(column_id)
    column_favorites.where(colmn_id: column_id).exists?
  end


  include JpPrefecture
  jp_prefecture :prefecture_code

  def prefecture_name
  	JpPrefecture::Prefecture.find(code: prefecture_code).try(:name)
  end

  def prefecture_name=(prefecture_name)
  	self.prefecture_code = JpPrefecture::Prefecture.find(name: prefecture_name).code
  end
end
