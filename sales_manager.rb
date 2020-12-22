class SalesManager
  
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
