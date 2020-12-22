class StocksManager
  
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
