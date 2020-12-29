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
  MONEY = [10, 50, 100, 500, 1000].freeze
  def initialize
    @slot_money = 0

    @coke = {product_id: 1, name: 'コーラ', price: 120, stocks: 5}
    @redbull = {product_id: 2, name: 'レッドブル', price: 200, stocks: 5}
    @water = {product_id: 3, name: '水', price: 100, stocks: 5}
    @juice_list = [
      {product_id: 1, name: 'コーラ', price: 120, stocks: 5},
      {product_id: 2, name: 'レッドブル', price: 200, stocks: 5},
      {product_id: 3, name: '水', price: 100, stocks: 5}
    ]
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

  def show_stock
    p "コーラは#{@coke[:stocks]}本です"
    p "レッドブルは#{@redbull[:stocks]}本です"
    p "水は#{@water[:stocks]}本です"
  end


  def new_purchase
    puts '何を購入しますか？'
    puts '1：コーラ'
    puts '2：レッドブル'
    puts '3：水'
    input_number = gets.to_i
    bought_juice = @juice_list[:product_id].find(input_number)
    byebug
    if bought_juice == @coke
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
        # elsif users_action == 2
        #   if @slot_money >= @redbull[:price] && @redbull[:stocks] > 1
        #     @redbull[:stocks] -= 1
        #     @slot_money = @slot_money - @redbull[:price]
        #     @sales = @sales + @redbull[:price]
        #     puts 'レッドブルです'
        #     return_money
        #   else
        #     puts '購入できません'
        #     return_money
        #   end
        # elsif users_action == 3
        #   if @slot_money >= @water[:price] && @water[:stocks] > 1
        #     @water[:stocks] -= 1
        #     @slot_money = @slot_money - @water[:price]
        #     @sales = @sales + @water[:price]
        #     puts '水です'
        #     return_money
        #   else
        #     puts '購入できません'
        #     return_money
        #   end
        # else
        #   puts "無効な入力です"
        # end

  def check_sales
    @sales
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

  def buyable_juice_list
    juice_lists = [@coke, @redbull, @water]
    @juice_stocks_sum = 0
    juice_lists.each do |list|
      if @slot_money >= list[:price] && list[:stocks] >= 1
        @juice_stocks_sum = @juice_stocks_sum + list[:stocks]
      end
    end
    if @juice_stocks_sum == 0
      puts "買えるものがありません"
    else
      juice_lists.each do |list|
        if @slot_money >= list[:price] && list[:stocks] >= 1
          puts list[:name]
        end
      end
    end
  end
end


#juice = @coke[:stocks] + @redbull[:stocks] + @water[:stocks]
#if juice == 0
    # if @slot_money < 100
    #   puts "お金がたりません"
    # else
    #   juice_lists.each do |list|
    #     if @slot_money >= list[:price] && list[:stocks] >= 1
    #       puts list[:name]
    #     end
    #   end
    # end
