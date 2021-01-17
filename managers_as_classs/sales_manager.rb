class SalesManager
  MONEY = [10, 50, 100, 500, 1000].freeze

  def buyable_juice_list
    @juice_lists.each do |juice|
      if juice[:stocks] == 0
        puts "#{juice[:name]}：売切中"
      elsif @slot_money <= juice[:price]
        lack_amount = juice[:price] - @slot_money
        puts "#{juice[:name]}：#{juice[:price]}円：#{lack_amount}円足りません"
      else
        puts "#{juice[:name]}：#{juice[:price]}円：販売中"
      end
    end
  end

  def slot_money
    puts 'いくら入れますか？'
    puts "#{MONEY}"
    money = gets.to_i
    if MONEY.include?(money)
      @slot_money += money
      puts "#{money}円投入されました"
    else
      puts "取り扱いできません。#{money}円のお返しです。"
    end
  end

  def current_slot_money
    @slot_money
  end

  def purchase(user_action)
    product_number = user_action
    selected_juice = @juice_lists[product_number]
    if @slot_money >= selected_juice[:price] && selected_juice[:stocks] >= 1
      selected_juice[:stocks] -= 1
      @slot_money = @slot_money - selected_juice[:price]
      @sales = @sales + selected_juice[:price]
      puts "#{selected_juice[:name]}です。\n残金は#{current_slot_money}円です。"
    elsif @slot_money < selected_juice[:price]
      puts 'お金が足りません'
    else
      puts "#{selected_juice[:name]}は売切中です。"
    end
  end

  def return_money
    puts "#{@slot_money}円のお返しです。"
    @slot_money = 0
  end
end
