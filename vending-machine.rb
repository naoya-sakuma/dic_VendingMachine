#　初期設定
# work7ディレクトリにて、irb
# require './vending-machine.rb'
# vm = VendingMachine.new

# 作成した自動販売機に100円を入れる
# vm.slot_money (1000)
# 作成した自動販売機に入れたお金がいくらかを確認する（表示する）
# vm.current_slot_money
# 作成した自動販売機に入れたお金を返してもらう
# vm.return_money
# ジュースを購入する
# vm.purchace
# 現在の売上を確認する
# vm.check_sales
# 自動販売機にジュースを追加する
# add_juice_to_vending_machine

class VendingMachine
  MONEY = [10, 50, 100, 500, 1000].freeze
  def initialize
    @slot_money = 0
    @juice_stock = {name: 'coke', price: 120, stocks: 5}
    @coke = {name: 'coke', price: 120, stocks: 5}
    @redbull = {name: 'redbull', price: 200, stocks: 5}
    @water = {name: 'water', price: 100, stocks: 5}
    @sales = 0
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

  #ステップ3、ジュースの購入Ver.1（挙動未確認）
def show_stock
  p @juice_stock
end
def purchase
  if @slot_money >= @juice_stock[:price] && @juice_stock[:stocks] > 1
      puts '購入しますか？'
      puts '1：購入する'
      puts '2：購入しない'
      puts '1か2を入力してください'
      users_action = gets.to_i
        if users_action == 1
          @juice_stock[:stocks] -= 1
          @slot_money = @slot_money - @juice_stock[:price]
          @sales = @sales + @juice_stock[:price]
          puts 'コーラです'
          return_money
        elsif users_action == 2
          return_money
        else
          puts "無効な入力です"
        end
  else
    puts 'お金がたりません'
    return_money
  end
end

  #ステップ3、ジュースの購入Ver.2（エラー）
  # def buy(juice_name)
  #   if juice_name == 'coke'
  #     if @slot_money >= @coke[:price] && @coke[:stocks] >= 1
  #       @coke = @coke[:stocks] - 1
  #       @slot_money = @slot_money - @coke[:price]
  #       @sales = @sales + @coke[:price]
  #       puts 'コーラです'
  #       return_money
  #     else
  #       puts '購入できません'
  #       return_money
  #     end
  #   elsif juice_name == 'redbull'
  #     if @slot_money >= @redbull[:price] && @redbull[:stocks] >= 1
  #       @redbull = @redbull[:stocks] - 1
  #       @slot_money = @slot_money - @redbull[:price]
  #       @sales = @sales + @redbull[:price]
  #       puts 'レッドブルです'
  #       return_money
  #     else
  #       puts '購入できません'
  #       return_money
  #     end
  #   elsif juice_name == 'water'
  #     if @slot_money >= @water[:price] && @water[:stocks] >= 1
  #       @water = @water[:stocks] - 1
  #       @slot_money = @slot_money - @water[:price]
  #       @sales = @sales + @water[:price]
  #       puts 'レッドブルです'
  #       return_money
  #     else
  #       puts '購入できません'
  #       return_money
  #     end
  #   else
  #     puts 'ジュースはありません'
  #   end
  # end

  #ステップ３、現在の売上を取得（挙動確認済み）
  def check_sales
    @sales
  end

  #ステップ4、ジュースの在庫を管理（挙動確認済み）
  def add_juice_to_vending_machine
    puts 'どのジュースを補充しますか？'
    puts '1：コーラ'
    puts '2：レッドブル'
    puts '3：水'
    select_juice_to_stock = gets.to_i
      if select_juice_to_stock  == 1
        @coke[:stocks] += 5
      elsif select_juice_to_stock  == 2
        @redbull = @redbull[:stocks] + 5
      elsif select_juice_to_stock  == 3
        @water = @water[:stocks] + 5
      else
        puts '何も補充していません'
      end
  end

  #ステップ4、ジュースの在庫を管理Ver2(エラー)
  def add_juice_to_vending_machine2(juice_name)
    if juice_name  == coke
      @coke[:stocks] += 5
    elsif juice_name  == redbull
      @redbull = @redbull[:stocks] + 5
    elsif juice_name == water
      @water = @water[:stocks] + 5
    else
      puts '何も補充していません'
    end
  end

  #ステップ4、購入可能なジュースを表示（作成中）
  def buyable_juice_lists
    now_on_sale_juice = []
  end
end
