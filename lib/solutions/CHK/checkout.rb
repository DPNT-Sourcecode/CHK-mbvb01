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
    A: {quantity: 3, discount: 20},
    B: {quantity: 2, discount: 15},
    E: {quantity: 2, discount: 15}
  }
end
  def checkout(skus)
    skus_array = skus.split('')
    @total = 0
    @sku_total = Hash.new(0)
    skus_array.each do |sku|
      if !@prices.has_key? sku.to_sym
        return @total = -1
      end
      @sku_total[sku] += 1
      @total += @prices[sku.to_sym]
    end
    if @sku_total['A'] >= 3
      if @sku_total['A'] >= 5
        x = @sku_total['A'] - (@sku_total['A'] % 5)
        y = x/5
        @total -= (y*10)
      end
      x = y - (@sku_total['A'] % 3)
      y = x/3
      @total -= (y*20)
    end
    if @sku_total['B'] >= 2
      x = @sku_total['B'] - (@sku_total['B'] % 2)
      y = x/2
      @total -= (y*15)
    end
    if @sku_total['E'] >= 2 && @sku_total['B'] >= 1
      x = @sku_total['E'] - (@sku_total['E'] % 2)
      y = x/2
      z = @sku_total['B'] / y
      @total -= (z*30)
    end
    @total
  end

end

