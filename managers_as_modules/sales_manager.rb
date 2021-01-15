module SalesManager
  MONEY = [10, 50, 100, 500, 1000].freeze
  
  def buyable_juice_list
    @juice_lists.each do |juice|
      if juice[:stocks] == 0
        puts "#{juice[:name]}：売切中"
      else @slot_money >= juice[:price]
        puts "#{juice[:name]}：販売中、#{juice[:price]}円"
      end
    end
  end

  def slot_money(money)
    return false unless MONEY.include?(money)
    @slot_money += money
  end

  def current_slot_money
    @slot_money
  end

  def purchase
    # puts '何を購入しますか？'
    # puts "0：coke\n1：レッドブル\n2：水"
    product_number = gets.to_i
    return "0 〜 2の数字を入力してください" unless [0, 1, 2].include?(product_number)
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
    puts @slot_money
    @slot_money = 0
  end

end
