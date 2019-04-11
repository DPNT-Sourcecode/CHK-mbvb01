class Checkout

  def initialize
    @prices = {
      I:35,J:60,K:70,L:90,X:17,Z:21,nil=>0
    }

    [:A,:P,:R,:V].each {|key| @prices[key] = 50}
    [:E,:N,:U].each {|key| @prices[key] = 40}
    [:B,:Q].each {|key| @prices[key] = 30}
    [:C,:G,:S,:T,:W,:Y].each {|key| @prices[key] = 20}
    [:D,:M].each {|key| @prices[key] = 15}
    [:F,:H,:O].each {|key| @prices[key] = 10}

    @deals = {
      AAAAAA: {quantity: 5, discount: 200},
      AAA: {quantity: 3, discount: 130},
      BB: {quantity: 2, discount: 45},
      EE: {quantity: 2, discount: 80, free: 'B'},
      FFF: {quantity: 3, discount: 20},
      HHHHH: {quantity: 5, discount: 45},
      HHHHHHHHHH: {quantity: 10, discount: 80},
      KK: {quantity: 2, discount: 120},
      NNN: {quantity: 3, discount: 120, free: 'M'},
      PPPPP: {quantity: 5, discount: 200},
      QQQ: {quantity: 3, discount: 80},
      RRR: {quantity: 3, discount: 150, free: 'Q'},
      UUUU: {quantity: 4, discount: 120},
      VV: {quantity: 2, discount: 90},
      VVV: {quantity: 3, discount: 130}
    }
    @volume = ['A','B','F','H','V','K','P','Q','U']
    @get_free = ['E','N','R']
  end
  def checkout(skus)
    skus_array = skus.split('').sort_by! {|key| return @total = -1 unless @prices.key? key.to_sym; @prices[key.to_sym] }.reverse!
    @total = 0
    @sku_total = Hash.new(0)
    skus_array.each { |sku| @sku_total[sku] += 1 }
    @group_total = @sku_total.select {|key,value| [:S,:T,:X,:Y,:Z].include?(key.to_sym)}
    while @group_total.values.inject(0){|sum,x| sum + x } >= 3  do
      @total += 45
      remove = 3
      @group_total.each do |key, value| 
        if remove > 0
          case
          when value - remove >= 0
            @group_total[key] -= remove
            @sku_total[key] -= remove
            remove = 0
          when value - remove < 0
            @group_total[key] = 0
            @sku_total[key] = 0
            remove -= value
          end
        end
      end
    end
    @get_free.each {|sku| buy_and_get_free(sku)}  
    @volume.each {|sku| discount(sku)}
    @sku_total.each { |sku, value| @total += value * @prices[sku.to_sym] }
    @total
  end

  def discount(letter)
    @volume_deals = @deals.select {|key,value| key.to_s.include?letter.to_s}
    @deal_num = 0
    keys = @volume_deals.keys
    while @deal_num < @volume_deals.length
      while @sku_total[letter] >= @volume_deals[keys[@deal_num]][:quantity] do
        @total += @volume_deals[keys[@deal_num]][:discount]
        @sku_total[letter] -= @volume_deals[keys[@deal_num]][:quantity]
      end
      @deal_num += 1
    end
  end

  def buy_and_get_free(letter)
    @buy_and_get_free_deals = @deals.select {|key,value| key.to_s.include?letter.to_s}
    keys = @buy_and_get_free_deals.keys
    while @sku_total[letter] >= @buy_and_get_free_deals[keys[0]][:quantity] && @sku_total[@buy_and_get_free_deals[keys[0]][:free]] >= 1 do
      @total += @buy_and_get_free_deals[keys[0]][:discount]
      @sku_total[letter] -= @buy_and_get_free_deals[keys[0]][:quantity]
      @sku_total[@buy_and_get_free_deals[keys[0]][:free]] -= 1
    end
  end
end







