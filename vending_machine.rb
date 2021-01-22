#　初期設定
# vending_machineディレクトリにて、irb
# require './vending_machine.rb'
# vm = VendingMachine.new

# load './vending_machine.rb'
# load './functions_as_modules/management_functions.rb'
# load './functions_as_modules/selling_functions.rb'

require './modules_files/management_methods.rb'
require './modules_files/selling_methods.rb'


class VendingMachine
  include SellingFunctions
  include StockManagementFunctions
  include SalesManagementFunctions

  def turn_on
    while true
      puts 'モードを選択してください'
      puts "0：販売モード\n1：管理モード\n2：電源を切る"
      mode = gets.to_i
      case mode
      when 0 then selling_mode
      when 1 then management_mode
      when 2 then break
      else puts '0か1を入力してください。'
      end
    end
  end

  def selling_mode
    while true
      puts '-------------------------------------'
      puts "現在の投入金額：#{current_slot_money}円"
      buyable_products_list
      puts "0：商品を買う\n1：お金をいれる\n2：お金を取り出す"
      user_action = gets.to_i
      case user_action
      when 0
        message_to_sell
        product_number = gets.to_i
        purchase(product_number)
      when 1 then slot_money
      when 2 then return_money
      when 3 then break
      else puts '0〜4の数字を入力してください。'
      end
    end
  end

  def management_mode
    while true
      puts '-------------------------------------'
      puts '管理モードです。'
      puts "0：在庫を確認\n1：在庫を追加\n2：売上金を確認\n3：売上金の取出\n4：管理モードを終了する"
      admin_action = gets.to_i
      case admin_action
      when 0 then check_stocks
      when 1
        message_to_stock
        product_number = gets.to_i
        add_stocks(product_number)
      when 2 then check_sales
      when 3 then take_out_sales
      when 4 then break
      else puts '0〜4の数字を入力してください。'
      end
    end
  end
end
