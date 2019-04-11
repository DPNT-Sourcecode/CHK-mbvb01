# noinspection RubyUnusedLocalVariable
class Checkout

def initialize
  @prices = {
    I: 35,
    J: 60,
    K: 70,
    L: 90,
    X: 17,
    Z: 21,
    nil => 0
  }
  [:A,:P,:R,:V,:Z].each {|key| @prices[key] = 50}
  [:E,:N,:U].each {|key| @prices[key] = 40}
  [:B,:Q].each {|key| @prices[key] = 30}
  [:C,:G,:S,:T,:W,:Y].each {|key| @prices[key] = 20}
  [:D,:M].each {|key| @prices[key] = 15}
  [:F,:H,:O].each {|key| @prices[key] = 10}

  @deals = {
    AAAAAA: {quantity: 5, discount: 200},
    AAA: {quantity: 3, discount: 130},
    BB: {quantity: 2, discount: 45},
    EE: {quantity: 2, discount: 80},
    FFF: {quantity: 3, discount: 20},
    HHHHH: {quantity: 5, discount: 45},
    HHHHHHHHHH: {quantity: 10, discount: 80},
    KK: {quantity: 2, discount: 120},
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
    @group_total = @sku_total.select {|key,value| [:S,:T,:X,:Y,:Z].include?(key.to_sym)}
    while @group_total.values.inject(0){|sum,x| sum + x } >= 3  do
      p @group_total
      p keys = @group_total.keys
      @total += 45
      @group_total[keys[0]] -= 1
      @group_total[keys[1]] -= 1
      @group_total[keys[2]] -= 1
      @sku_total[keys[0]] -= 1
      @sku_total[keys[1]] -= 1
      @sku_total[keys[2]] -= 1
      @group_total.delete_if {|key, value| value < 1}
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

    while @sku_total['R'] >= @deals[:RRR][:quantity] && @sku_total['Q'] >= 1
      @total += @deals[:RRR][:discount]
      @sku_total['R'] -= 3
      @sku_total['Q'] -= 1
    end

    while @sku_total['U'] >= @deals[:UUUU][:quantity] do
      @total += @deals[:UUUU][:discount]
      @sku_total['U'] -= 4
    end

    while @sku_total['H'] >= @deals[:HHHHHHHHHH][:quantity] do
      @total += @deals[:HHHHHHHHHH][:discount]
      @sku_total['H'] -= 10
    end
 
    while @sku_total['H'] >= @deals[:HHHHH][:quantity] do
      @total += @deals[:HHHHH][:discount]
      @sku_total['H'] -= 5
    end

    while @sku_total['V'] >= @deals[:VVV][:quantity] do
      @total += @deals[:VVV][:discount]
      @sku_total['V'] -= 3
    end
  
    while @sku_total['V'] >= @deals[:VV][:quantity] do
      @total += @deals[:VV][:discount]
      @sku_total['V'] -= 2
    end

    while @sku_total['K'] >= @deals[:KK][:quantity] do
      @total += @deals[:KK][:discount]
      @sku_total['K'] -= 2
    end

    while @sku_total['P'] >= @deals[:PPPPP][:quantity] do
      @total += @deals[:PPPPP][:discount]
      @sku_total['P'] -= 5
    end

    while @sku_total['Q'] >= @deals[:QQQ][:quantity] do
      @total += @deals[:QQQ][:discount]
      @sku_total['Q'] -= 3
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

