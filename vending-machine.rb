#　初期設定
# work7ディレクトリにて、irb
# require './vending-machine.rb'
# load './vending-machine.rb'
# load './managers_as_modules/money_manager.rb'
# load './managers_as_modules/stocks_manager.rb'
# load './managers_as_modules/sales_manager.rb'
# vm = VendingMachine.new

# メソッド
# vm.current_slot_money
# vm.slot_money (1000)
# vm.return_money
# vm.show_stock
# vm.purchase
# vm.check_sales
# vm.add_stocks
# vm.buyable_juice_list
require 'byebug'
require './managers_as_modules/money_manager.rb'
require './managers_as_modules/stocks_manager.rb'
require './managers_as_modules/sales_manager.rb'

class VendingMachine
  include MoneyManager
  include StocksManager
  include SalesManager

  MONEY = [10, 50, 100, 500, 1000].freeze
  def initialize
    @slot_money = 0
    @sales = 0
    @coke = {name: 'コーラ', price: 120, stocks: 5}
    @redbull = {name: 'レッドブル', price: 200, stocks: 5}
    @water = {name: '水', price: 100, stocks: 5}
    @juice_lists = [@coke, @redbull, @water]
  end

  def turn_on
    while true
      buyable_juice_list
      puts "現在の投入金額：#{current_slot_money}円"
      puts '何をしますか？'
      puts "0：cokeを買う\n1：レッドブルを買う\n2：水を買う\n3：お金をいれる"
      user_action = gets.to_i
      if [0, 1, 2].include?(user_action)
        purchase(user_action)
      elsif user_action == 3
        slot_money
      elsif user_action == 4
        puts '管理モードです。'
        puts '何をしますか？'
        puts "0：在庫を確認\n1：在庫を追加\n2：売上金を確認\n3：売上金の取出\n4：電源を切る"
        #@admin_functions = [check_stocks, add_stocks, check_sales, take_out_sales]
        admin_action = gets.to_i
        if admin_action == 0
          check_stocks
        elsif admin_action == 1
          add_stocks
        elsif admin_action == 2
          check_sales
        elsif admin_action == 3
          take_out_sales
        elsif admin_action == 4
          break
        end
      end
    end
  end
end
