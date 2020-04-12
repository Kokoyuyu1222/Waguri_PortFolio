class Consumer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable
  has_many :cart_products

  enum withdraw: { draft: false, published: true }
  enum gender: { man: 0, woman: 1 }
  enum age: { ten: 0,twenty: 1,thirty: 2, forty: 3,fifty: 4}




  include JpPrefecture
  jp_prefecture :prefecture_code

  def prefecture_name
  	JpPrefecture::Prefecture.find(code: prefecture_code).try(:name)
  end

  def prefecture_name=(prefecture_name)
  	self.prefecture_code = JpPrefecture::Prefecture.find(name: prefecture_name).code
  end
end
