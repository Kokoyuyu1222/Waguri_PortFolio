require 'csv'

CSV.generate do |csv|
  csv_column_names = %w(商品名 カテゴリー ブランド 在庫 販売ステータス 税込価格  作成日)
  csv << csv_column_names
  @products.each do |product|
    column_values = [
      product.name,
      product.brand.category.name,
      product.brand.name,
      product.stock.quantity,
      product.sale_status,
      product.unit_price,
      product.created_at
    ]
    csv << column_values
  end
end
