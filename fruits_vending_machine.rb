# 初期設定
# vending_machineディレクトリにて、irb
# require './fruits_vending_machine.rb'
# vm = FruitsVendingMachine.new

# load './fruits_vending_machine.rb'
# load './modules_files/management_functions.rb'
# load './modules_files/selling_functions.rb'exit

require './vending_machine.rb'

class FruitsVendingMachine < VendingMachine
  def initialize
    @slot_money = 0
    @sales = 0

    @strawberry = {name: 'イチゴ', price: 590, stocks: 5}
    @grape = {name: 'ぶどう', price: 690, stocks: 5}
    @melon = {name: 'メロン', price: 1400, stocks: 5}
    @orange = {name: 'オレンジ', price: 320, stocks: 5}
    @products_list = [@strawberry, @grape, @melon, @orange]
  end

  def messages_to_sell_product
    puts 'どの商品を購入しますか？'
    puts "0：イチゴ\n1：ぶどう\n2：メロン\n3：オレンジ"
  end

  def messages_to_stock_product
    puts 'どの商品を補充しますか？'
    puts "0：イチゴ\n1：ぶどう\n2：メロン\n3：オレンジ"
  end
end
