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
      puts "現在の投入金額：#{current_slot_money}円"
      buyable_juice_list
      puts "0：コーラを買う\n1：レッドブルを買う\n2：水を買う\n3：お金をいれる\n4：お金を取り出す"
      user_action = gets.to_i
      case user_action
      when 0..2 then purchase(user_action)
      when 3 then slot_money
      when 4 then return_money
      when 5
        puts '管理モードです。'
        puts "0：在庫を確認\n1：在庫を追加\n2：売上金を確認\n3：売上金の取出\n4：電源を切る"
        admin_action = gets.to_i
        case admin_action
        when 0 then check_stocks
        when 1 then add_stocks
        when 2 then check_sales
        when 3 then take_out_sales
        when 4 then break
        else
          puts '0〜4の数字を入力してください。'
        end
      else
        puts '0〜4の数字を入力してください。'
      end
    end
  end
end
