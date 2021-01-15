#　初期設定
# work7ディレクトリにて、irb
# require './vending-machine.rb'
# load './vending-machine.rb'
# vm = VendingMachine.new

# メソッド
# vm.current_slot_money
# vm.slot_money (1000)
# vm.return_money
# vm.show_stock
# vm.purchace
# vm.check_sales
# vm.add_stocks
# vm.buyable_juice_list
require 'byebug'
require './managers_as_modules/money_manager.rb'
require './managers_as_modules/stocks_manager.rb'

class VendingMachine
  MONEY = [10, 50, 100, 500, 1000].freeze
  def initialize
    @slot_money = 0
    @sales = 0
    @coke = {product_id: 1, name: 'コーラ', price: 120, stocks: 5}
    @redbull = {product_id: 2, name: 'レッドブル', price: 200, stocks: 5}
    @water = {product_id: 3, name: '水', price: 100, stocks: 5}
    @juice_lists = [@coke, @redbull, @water]
  end

  def purchase
    puts '何を購入しますか？'
    puts "0：coke\n1：レッドブル\n2：水"
    input_number = gets.to_i
    return "0 〜 2の数字を入力してください" unless [0, 1, 2].include?(input_number)

    selected_juice = @juice_lists[input_number]
    if @slot_money >= selected_juice[:price] && selected_juice[:stocks] >= 1
      selected_juice[:stocks] -= 1
      @slot_money = @slot_money - selected_juice[:price]
      @sales = @sales + selected_juice[:price]
      puts "#{selected_juice[:name]}です。\n残金は#{current_slot_money}円です"
    elsif @slot_money < selected_juice[:price]
      puts 'お金が足りません'
    else
      puts "#{selected_juice[:name]}は売切中です。"
    end
  end

  def current_slot_money
    @slot_money
  end

  def slot_money(money)
    return false unless MONEY.include?(money)
    @slot_money += money
  end

  def return_money
    puts @slot_money
    @slot_money = 0
  end

  def show_stock
    p "コーラは#{@coke[:stocks]}本です"
    p "レッドブルは#{@redbull[:stocks]}本です"
    p "水は#{@water[:stocks]}本です"
  end

  def check_sales
    @sales
  end

  def buyable_juice_list
    @juice_lists.each do |juice|
      if juice[:stocks] == 0
        puts "#{juice[:name]}：売切中"
      else @slot_money >= juice[:price]
        puts "#{juice[:name]}：販売中"
      end
    end
  end

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
end
