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
  # ステップ０　お金の投入と払い戻しの例コード
  # ステップ１　扱えないお金の例コード
  # 10円玉、50円玉、100円玉、500円玉、1000円札を１つずつ投入できる。
  MONEY = [10, 50, 100, 500, 1000].freeze
  # （自動販売機に投入された金額をインスタンス変数の @slot_money に代入する）
  def initialize
    # 最初の自動販売機に入っている金額は0円
    @slot_money = 0
    @juice_stock = {name: 'coke', price: 120, stocks: 5}
    @coke = {name: 'coke', price: 120, stocks: 5}
    @redbull = {name: 'redbull', price: 200, stocks: 5}
    @water = {name: 'water', price: 100, stocks: 5}
    @sales = 0
  end
  # 投入金額の総計を取得できる。
  def current_slot_money
    # 自動販売機に入っているお金を表示する
    @slot_money
  end
  # 10円玉、50円玉、100円玉、500円玉、1000円札を１つずつ投入できる。
  # 投入は複数回できる。
  def slot_money(money)
    # 想定外のもの（１円玉や５円玉。千円札以外のお札、そもそもお金じゃないもの（数字以外のもの）など）
    # が投入された場合は、投入金額に加算せず、それをそのまま釣り銭としてユーザに出力する。
    return false unless MONEY.include?(money)
    # 自動販売機にお金を入れる
    @slot_money += money
  end
  # 払い戻し操作を行うと、投入金額の総計を釣り銭として出力する。
  def return_money
    # 返すお金の金額を表示する
    puts @slot_money
    # 自動販売機に入っているお金を0円に戻す
    @slot_money = 0
  end

  #ステップ3、ジュースの購入Ver.1（挙動未確認）
  def purchace
    if @slot_money >= @juice_stock[:price] && @juice_stock[:stocks] > 1
      puts '購入しますか？'
      puts '1：購入する'
      puts '2：購入しない'
      puts '1か2を入力してください'
      users_action = gets.to_i
        if gets.to_i == 1
          @juice_stock = @juice_stock[:stocks] - 1
          @slot_money = @slot_money - @juice_stock[:price]
          @sales = @sales + @juice_stock[:price]
          puts 'コーラです'
          return_money
        else gets.to_i == 2
          return_money
        end
    else
      puts '購入できません'
      return_money
    end
  end

  #ステップ3、ジュースの購入Ver.2（エラー）
  def buy(juice_name)
    if juice_name == 'coke'
      if @slot_money >= @coke[:price] && @coke[:stocks] >= 1
        @coke = @coke[:stocks] - 1
        @slot_money = @slot_money - @coke[:price]
        @sales = @sales + @coke[:price]
        puts 'コーラです'
        return_money
      else
        puts '購入できません'
        return_money
      end
    elsif juice_name == 'redbull'
      if @slot_money >= @redbull[:price] && @redbull[:stocks] >= 1
        @redbull = @redbull[:stocks] - 1
        @slot_money = @slot_money - @redbull[:price]
        @sales = @sales + @redbull[:price]
        puts 'レッドブルです'
        return_money
      else
        puts '購入できません'
        return_money
      end
    elsif juice_name == 'water'
      if @slot_money >= @water[:price] && @water[:stocks] >= 1
        @water = @water[:stocks] - 1
        @slot_money = @slot_money - @water[:price]
        @sales = @sales + @water[:price]
        puts 'レッドブルです'
        return_money
      else
        puts '購入できません'
        return_money
      end
    else
      puts 'ジュースはありません'
    end
  end

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
        @coke = @coke[:stocks] + select_juice_to_stock
      elsif select_juice_to_stock  == 2
        @redbull = @redbull[:stocks] + select_juice_to_stock
      elsif select_juice_to_stock  == 3
        @water = @water[:stocks] + select_juice_to_stock
      else
        puts '何も補充していません'
      end
  end

  #ステップ4、ジュースの在庫を管理Ver2(エラー)
  def add_juice_to_vending_machine2(juice_name)
    if juice_name  == coke
      @coke = @coke[:stocks] + 5
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
