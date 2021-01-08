#　初期設定
# original_2020_12_29ディレクトリにて、irb
# require './vending-machine.rb'
# load './vending-machine.rb'
# vm = VendingMachine.new

# メソッド
# vm.current_slot_money
# vm.slot_money (1000)
# vm.return_money
# vm.show_stock
# vm.purchase
# vm.new_purchase
# vm.check_sales
# vm.add_juice_to_vending_machine
# vm.buyable_juice_list
require 'byebug'

class VendingMachine
  include MoneyManager
  include SalesManager
  include StocksManager
  
  MONEY = [10, 50, 100, 500, 1000].freeze
  def initialize
    @slot_money = 0
    @coke = {product_id: 1, name: 'コーラ', price: 120, stocks: 5}
    @redbull = {product_id: 2, name: 'レッドブル', price: 200, stocks: 5}
    @water = {product_id: 3, name: '水', price: 100, stocks: 5}
    @sales = 1000
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

  def purchase
    puts '何を購入しますか？'
    puts '1：コーラ'
    puts '2：レッドブル'
    puts '3：水'
    users_action = gets.to_i
    if users_action == 1
      if @slot_money >= @coke[:price] && @coke[:stocks] > 1
        @coke[:stocks] -= 1
        @slot_money = @slot_money - @coke[:price]
        @sales = @sales + @coke[:price]
        puts 'コーラです'
        return_money
      else
        puts '購入できません'
        return_money
      end
    else
      puts "無効な入力です"
    end
  end

  def buyable_juice_list
    juice_lists = [@coke, @redbull, @water]
    @juice_stocks_sum = 0
    juice_lists.each do |juice|
      if @slot_money >= juice[:price] && juice[:stocks] >= 1
        @juice_stocks_sum = @juice_stocks_sum + list[:stocks]
      end
    end
    if @juice_stocks_sum == 0
      puts "買えるものがありません"
    else
      juice_lists.each do |juice|
        if @slot_money >= juice[:price] && juice[:stocks] >= 1
          puts list[:name]
        end
      end
    end
  end
end
