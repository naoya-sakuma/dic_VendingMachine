module SellingFunctions
  MONEY = [10, 50, 100, 500, 1000].freeze

  def current_slot_money
    @slot_money
  end

  def buyable_products_list
    @products_list.each do |product|
      if product[:stocks] == 0
        puts "[#{product[:name]}：#{product[:price]}円]\s売切中"
      elsif @slot_money <= product[:price]
        lack_amount = product[:price] - @slot_money
        puts "[#{product[:name]}：#{product[:price]}円]\s#{lack_amount}円不足"
      else
        puts "[#{product[:name]}：#{product[:price]}円]\s販売中"
      end
    end
  end

  def purchase(product_number)
    selected_product = @products_list[product_number]
    if @slot_money >= selected_product[:price] && selected_product[:stocks] >= 1
      selected_product[:stocks] -= 1
      @slot_money = @slot_money - selected_product[:price]
      @sales = @sales + selected_product[:price]
      puts "#{selected_product[:name]}です。\n残金は#{current_slot_money}円です。"
    elsif @slot_money < selected_product[:price]
      puts 'お金が足りません。'
    else
      puts "#{selected_product[:name]}は売切中です。"
    end
  end

  def slot_money
    puts 'いくら入れますか？'
    puts "#{MONEY}"
    money = gets.to_i
    if MONEY.include?(money)
      @slot_money += money
      puts "#{money}円投入されました。"
    else
      puts "取り扱いできません。#{money}円お返しします。"
    end
  end

  def return_money
    if @slot_money == 0
      puts "お金が投入されていません。"
    else
      puts "#{@slot_money}円お返しします。"
      @slot_money = 0
    end
  end
end
