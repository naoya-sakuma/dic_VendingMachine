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
    @juice_lists.each do |juice|
      p "#{juice[:name]}の在庫：#{juice[:stocks]}本"
    end
  end
end
