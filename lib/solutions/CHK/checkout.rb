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
    '5A': {quantity: 5, discount: 200},
    '3A': {quantity: 3, discount: 130},
    '2B': {quantity: 2, discount: 45},
    '2E': {quantity: 2, discount: 50}
  }
end
  def checkout(skus)
    skus_array = skus.split('')
    @total = 0
    @sku_total = Hash.new(0)
    skus_array.each do |sku|
      @sku_total[sku] += 1
    end
p @deals['5A']
    while @sku_total['A'] >= @deals['AAAAAA'][:quantity] do
     @total += @deals['AAAAAA'][:discount]
     @sku_total['A'] -= 5
    end

    while @sku_total['A'] >= @deals['3A']['quantity'] do
      @total += @deals['3A']['discount']
      @sku_total['A'] -= 3
     end
    
    while @sku_total['E'] >= @deals['2E']['quantity'] && @sku_total['B'] >= 1
      @total += @deals['2E']['discount']
      @sku_total['E'] -= 2
    end

    while @sku_total['B'] >= @deals['2B']['quantity'] do
      @total += @deals['2B']['discount']
      @sku_total['B'] -= 2
     end

    skus_total.each do |sku|
      if !@prices.has_key? sku.to_sym
        return @total = -1
      end
      @total += @prices[sku.to_sym]
    end
    @total
  end

end




