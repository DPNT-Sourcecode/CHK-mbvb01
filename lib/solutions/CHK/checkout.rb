# noinspection RubyUnusedLocalVariable
class Checkout

def initialize
  @prices = {
    A: 50,
    B: 30,
    C: 20,
    D: 15
  }
end
  def checkout(skus)
    skus_array = skus.split('')
    @total = 0
    skus_array.each do |sku|
      p @prices[sku]
      @total += @prices[sku]
    end
    @total
  end

end


