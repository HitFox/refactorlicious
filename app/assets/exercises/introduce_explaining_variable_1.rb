def price
  # price is base price - quantity discount + shipping
  return @quantity * @item_price -
    [0, @quantity - 500].max * @item_price * 0.05 +
    [@quantity * @item_price * 0.1, 100.0].min
end

#SOLUTION
def price
  base_price = @quantity * @item_price
  quantity_discount = [0, @quantity - 500].max * @item_price * 0.05
  shipping = [base_price * 0.1, 100.0].min
  return base_price - quantity_discount + shipping
end
