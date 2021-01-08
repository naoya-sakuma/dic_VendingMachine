module MoneyManager
  def check_sales
    @sales
  end

  def take_out_sales
    puts @sales
    @sales = 0
  end
end

module StocksManager
  def add_stocks
    puts 'どのジュースを補充しますか？'
    puts '1：コーラ'
    puts '2：レッドブル'
    puts '3：水'
    select_juice_to_stock = gets.to_i
      if select_juice_to_stock  == 1
        @coke[:stocks] += 5
      elsif select_juice_to_stock  == 2
        @redbull[:stocks] += 5
      elsif select_juice_to_stock  == 3
        @water[:stocks] += 5
      else
        puts '何も補充していません'
      end
  end

  def show_stock
    p "コーラは#{@coke[:stocks]}本です"
    p "レッドブルは#{@redbull[:stocks]}本です"
    p "水は#{@water[:stocks]}本です"
  end
end

module SalesManager
  def slot_money(money)
    return false unless MONEY.include?(money)
    @slot_money += money
  end

  def current_slot_money
    @slot_money
  end

  def return_money
    puts @slot_money
    @slot_money = 0
  end

  def purchase
    puts '購入しますか？'
    puts '1：コーラを購入する'
    puts '2：レッドブルを購入する'
    puts '3：水を購入する'
    users_action = gets.to_i
    if users_action == 1
      if @slot_money >= @coke[:price] && @coke[:stocks] > 1
        @coke[:stocks] -= 1
        @slot_money = @slot_money - @coke[:price]
        @sales = @sales + @coke[:price]
        puts 'コーラです'
        return_money
      else
        puts '購入できません'
        return_money
      end
    elsif users_action == 2
      if @slot_money >= @redbull[:price] && @redbull[:stocks] > 1
        @redbull[:stocks] -= 1
        @slot_money = @slot_money - @redbull[:price]
        @sales = @sales + @redbull[:price]
        puts 'レッドブルです'
        return_money
      else
        puts '購入できません'
        return_money
      end
    elsif users_action == 3
      if @slot_money >= @water[:price] && @water[:stocks] > 1
        @water[:stocks] -= 1
        @slot_money = @slot_money - @water[:price]
        @sales = @sales + @water[:price]
        puts '水です'
        return_money
      else
        puts '購入できません'
        return_money
      end
    else
      puts "無効な入力です"
    end
  end
end
