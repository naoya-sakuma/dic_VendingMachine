module StocksManager
  def add_stocks
    puts 'どのジュースを補充しますか？'
    puts "0：コーラ\n1：レッドブル\n2：水"
    input_number = gets.to_i
    return "0 〜 2の数字を入力してください" unless [0, 1, 2].include?(input_number)
    juice_to_stock = @juice_lists[input_number]
    juice_to_stock[:stocks] += 5
    puts "#{juice_to_stock[:name]}を5本追加しました。"
  end

  def check_stocks
    @juice_lists.each do |juice|
      p "#{juice[:name]}の在庫：#{juice[:stocks]}本"
    end
  end
end
