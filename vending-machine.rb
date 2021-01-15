#　初期設定
# work7ディレクトリにて、irb
# require './vending-machine.rb'
# load './vending-machine.rb'
# load './managers_as_modules/money_manager.rb'
# load './managers_as_modules/stocks_manager.rb'
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

  MONEY = [10, 50, 100, 500, 1000].freeze
  def initialize
    @slot_money = 0
    @sales = 0
    @coke = {name: 'コーラ', price: 120, stocks: 5}
    @redbull = {name: 'レッドブル', price: 200, stocks: 5}
    @water = {name: '水', price: 100, stocks: 5}
    @juice_lists = [@coke, @redbull, @water]
  end

end
