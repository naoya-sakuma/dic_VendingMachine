module MoneyManager
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
