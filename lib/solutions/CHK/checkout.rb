# noinspection RubyUnusedLocalVariable
class Checkout

def initialize
  @prices = {
    A: 50,
    B: 30,
    C: 20,
    D: 15,
    nil => 0
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
      x = @sku_total['A'] - (@sku_total['A'] % 3)
      y = x/3
      @total -= (y*20)
    end
    if @sku_total['B'] >= 2
      @total -= 15
    end
    @total
  end

end


