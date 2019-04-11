# noinspection RubyUnusedLocalVariable
class Checkout

def initialize
  @prices = {
    A: 50,
    B: 30,
    C: 20,
    D: 15,
    E: 40,
    nil => 0
  }

  @deals = {
    AAAAAA: {quantity: 5, discount: 200},
    AAA: {quantity: 3, discount: 130},
    BB: {quantity: 2, discount: 45},
    EE: {quantity: 2, discount: 80}
  }
end
  def checkout(skus)
    skus_array = skus.split('')
    @total = 0
    @sku_total = Hash.new(0)
    skus_array.each do |sku|
      @sku_total[sku] += 1
    end
    while @sku_total['A'] >= @deals[:AAAAAA][:quantity] do
     @total += @deals[:AAAAAA][:discount]
     @sku_total['A'] -= 5
    end

    while @sku_total['A'] >= @deals[:AAA][:quantity] do
      @total += @deals[:AAA][:discount]
      @sku_total['A'] -= 3
     end
    
    while @sku_total['E'] >= @deals[:EE][:quantity] && @sku_total['B'] >= 1
      @total += @deals[:EE][:discount]
      @sku_total['E'] -= 2
      @sku_total['B'] -= 1
    end

    while @sku_total['B'] >= @deals[:BB][:quantity] do
      @total += @deals[:BB][:discount]
      @sku_total['B'] -= 2
     end

    @sku_total.each do |sku, value|
      if !@prices.has_key? sku.to_sym
        return @total = -1
      end
      @total += value * @prices[sku.to_sym]
    end
    @total
  end

end



