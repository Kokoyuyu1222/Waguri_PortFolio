class HomesController < ApplicationController
  def top
  	@products = Product.order("RAND()").limit(5)
  	@columns = Column.order("RAND()").limit(5)
  end
end
