class Destination < ApplicationRecord
	belongs_to :consumer

	validates :postcode, presence: true
  validates :name, presence: true

  include JpPrefecture
  jp_prefecture :prefecture_code

  def prefecture_name
  	JpPrefecture::Prefecture.find(code: prefecture_code).try(:name)
  end

  def prefecture_name=(prefecture_name)
  	self.prefecture_code = JpPrefecture::Prefecture.find(name: prefecture_name).code
  end

end