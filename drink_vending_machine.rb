# 初期設定
# vending_machineディレクトリにて、irb
# require './drink_vending_machine.rb'
# vm = DrinkVendingMachine.new

# load './drink_vending_machine.rb'
# load './modules_files/management_functions.rb'
# load './modules_files/selling_functions.rb'

require './vending_machine.rb'

class DrinkVendingMachine < VendingMachine
  def initialize
    @slot_money = 0
    @sales = 0

    @coke = {name: 'コーラ', price: 120, stocks: 5}
    @redbull = {name: 'レッドブル', price: 200, stocks: 5}
    @water = {name: '水', price: 100, stocks: 5}
    @products_list = [@coke, @redbull, @water]

  end

  def messages_to_sell_product
    puts 'どの商品を購入しますか？'
    puts "0：コーラ\n1：レッドブル\n2：水"
  end

  def messages_to_stock_product
    puts 'どの商品を補充しますか？'
    puts "0：コーラ\n1：レッドブル\n2：水"
  end
end
