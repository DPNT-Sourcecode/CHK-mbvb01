# noinspection RubyUnusedLocalVariable
class Checkout

  @prices = {
    A: 50,
    B: 30,
    C: 20,
    D: 15
  }
  def checkout(skus)
    skus_array = skus.split('')
    @total = 0
    skus_array.each |sku| do
      @total += @prices[sku]
    end
    @total
  end

end

