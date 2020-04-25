class Order < ApplicationRecord
	belongs_to :consumer
	has_many :order_products, dependent: :destroy
	has_many :products, through: :order_products
	accepts_nested_attributes_for :order_products,allow_destroy: true

    enum payment_method:{card: 0,bank:1}
	enum order_status:{wait: 0,confirm:1,start:2,preparation:3,finish:4}

    validates :name, presence: true
    validates :postcode, presence: true

    include JpPrefecture
  jp_prefecture :prefecture_code

  def prefecture_name
    JpPrefecture::Prefecture.find(code: prefecture_code).try(:name)
  end

  def prefecture_name=(prefecture_name)
    self.prefecture_code = JpPrefecture::Prefecture.find(name: prefecture_name).code
  end


end
