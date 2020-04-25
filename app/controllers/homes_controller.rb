class HomesController < ApplicationController
  def top
  	@products = Product.order("RANDOM()").limit(5)
  	@columns = Column.order("RANDOM()").limit(5)
  end
end
