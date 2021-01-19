#　初期設定
# vending_machineディレクトリにて、irb
# require './vending-machine_functions.rb'
# vm = VendingMachine.new

# load './vending-machine_functions.rb'
# load './functions_as_modules/management_functions.rb'
# load './functions_as_modules/selling_functions.rb'

require 'byebug'
require './functions_as_modules/management_functions.rb'
require './functions_as_modules/selling_functions.rb'

class VendingMachine
  include SellingFunctions
  include ManagementFunctions

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
      buyable_juice_list
      puts "0：コーラを買う\n1：レッドブルを買う\n2：水を買う\n3：お金をいれる\n4：お金を取り出す"
      user_action = gets.to_i
      case user_action
      when 0..2 then purchase(user_action)
      when 3 then slot_money
      when 4 then return_money
      when 5 then break
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
      when 1 then add_stocks
      when 2 then check_sales
      when 3 then take_out_sales
      when 4 then break
      else puts '0〜4の数字を入力してください。'
      end
    end
  end
end
