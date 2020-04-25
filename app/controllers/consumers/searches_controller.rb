class Consumers::SearchesController < ApplicationController
	layout 'consumer'
	before_action :authenticate_consumer!

	def search
		@model = params["search"]["model"]
		@content = params["search"]["content"]
		@how = params["search"]["how"]
		@datas = search_for(@how, @model, @content)
	end
	def search_for(how, model, content)
		case how
		when 'match'
			match(model, content)
		when 'forward'
			forward(model, content)
		when 'backward'
			backward(model, content)
		when 'partical'
			partical(model, content)
		end
	end

	def match(model, content)
		if model == 'fermer'
			Fermer.where(garden: content)
		elsif model == 'column'
			Column.where(title: content)
		elsif model == 'product'
			Product.where(name: content)
		elsif model == 'category'
			Category.where(name: content)
		elsif model == 'brand'
			Brand.where(name: content)
		end
	end

	def forward(model, content)
		if model == 'fermer'
			Fermer.where("garden LIKE ?", "#{content}%")
		elsif model == 'column'
			Column.where("title LIKE ?", "#{content}%")
		elsif model == 'product'
			Product.where("name LIKE ?", "#{content}%")
		elsif model == 'category'
			Category.where("name LIKE ?", "#{content}%")
		elsif model == 'brand'
			Brand.where("name LIKE ?", "#{content}%")
		end
	end
	def backward(model, content)
		if model == 'fermer'
			Fermer.where("garden LIKE ?", "%#{content}")
		elsif model == 'column'
			Column.where("title LIKE ?", "%#{content}")
		elsif model == 'product'
			Product.where("name LIKE ?", "%#{content}")
		elsif model == 'category'
			Category.where("name LIKE ?", "%#{content}")
		elsif model == 'brand'
			Brand.where("name LIKE ?", "%#{content}")
		end
	end

	def partical(model, content)
		if model == 'fermer'
			Fermer.where("garden LIKE ?","%#{content}%")
		elsif model == 'column'
			Column.where("title LIKE ?", "%#{content}%")
		elsif model == 'product'
			Product.where("name LIKE ?", "%#{content}%")
		elsif model == 'category'
			Category.where("name LIKE ?", "%#{content}%")
		elsif model == 'brand'
			Brand.where("name LIKE ?", "%#{content}%")
		end
	end
end
