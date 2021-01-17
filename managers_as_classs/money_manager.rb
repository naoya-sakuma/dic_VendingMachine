class MoneyManager
  def check_sales
    puts "現在の売上は#{@sales}円です。"
  end

  def take_out_sales
    puts "#{@sales}円取り出しました。"
    @sales = 0
  end
end
