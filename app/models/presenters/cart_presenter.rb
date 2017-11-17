class Presenters::CartPresenter

  def initialize(cart_items)
    @cart_items = cart_items
  end

  def bundles
    result = []
    cart_hash = @cart_items.pluck(:line_id).group_by { |el| el }

    cart_hash.each do |key, value|
      result << Bundle.new(key, value.size)
    end

    result
  end

end

Bundle = Struct.new(:line_id, :quantity) do
  def name
    Line.find(line_id).product.name
  end

  def price
    Line.find(line_id).price
  end

  def subtotal
    Line.find(line_id).price * quantity
  end
end
