# noinspection RubyUnusedLocalVariable
class Checkout

def initialize
  @prices = {
    I: 35,
    J: 60,
    K: 80,
    nil => 0
  }
  [:L,:X].each {|key| @prices[key] = 90}
  [:A,:P,:R,:V,:Z].each {|key| @prices[key] = 50}
  [:E,:N,:U].each {|key| @prices[key] = 40}
  [:B,:Q,:S].each {|key| @prices[key] = 30}
  [:C,:G,:T,:W].each {|key| @prices[key] = 20}
  [:D,:M].each {|key| @prices[key] = 15}
  [:F,:H,:O,:Y].each {|key| @prices[key] = 10}

  @deals = {
    AAAAAA: {quantity: 5, discount: 200},
    AAA: {quantity: 3, discount: 130},
    BB: {quantity: 2, discount: 45},
    EE: {quantity: 2, discount: 80},
    FFF: {quantity: 3, discount: 20},
    HHHHH: {quantity: 5, discount: 45},
    HHHHHHHHHH: {quantity: 10, discount: 80},
    KK: {quantity: 2, discount: 150},
    NNN: {quantity: 3, discount: 120},
    PPPPP: {quantity: 5, discount: 200},
    QQQ: {quantity: 3, discount: 80},
    RRR: {quantity: 3, discount: 150},
    UUUU: {quantity: 4, discount: 120},
    VV: {quantity: 2, discount: 90},
    VVV: {quantity: 3, discount: 130}
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

     while @sku_total['F'] >= @deals[:FFF][:quantity] do
      @total += @deals[:FFF][:discount]
      @sku_total['F'] -= 3
     end

     while @sku_total['N'] >= @deals[:NNN][:quantity] && @sku_total['M'] >= 1
      @total += @deals[:NNN][:discount]
      @sku_total['N'] -= 3
      @sku_total['M'] -= 1
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





