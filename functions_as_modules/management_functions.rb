module ManagementFunctions
  def check_stocks
    @products_list.each do |product|
      p "#{product[:name]}の在庫：#{product[:stocks]}本"
    end
  end

  def add_stocks(product_number)
    if [0, 1, 2].include?(product_number)
      product_to_stock = @products_list[product_number]
      product_to_stock[:stocks] += 5
      puts "#{product_to_stock[:name]}を5本追加しました。"
    else
      puts "0〜2の数字を入力してください。"
    end
  end

  def check_sales
    puts "現在の売上は#{@sales}円です。"
  end

  def take_out_sales
    if @sales == 0
      puts "売上は#{@sales}円です。"
    else
      puts "売上#{@sales}円を取り出しました。"
      @sales = 0
    end
  end
end
