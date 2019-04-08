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
    skus_array.each do |sku|
      if !@prices.has_key? sku.to_sym
        return @total = -1
      end
      @total += @prices[sku.to_sym]
    end
    @total
  end

end
