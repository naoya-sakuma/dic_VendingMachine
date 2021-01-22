### 開発方針
- 変数やメソッドなどの命名は、長くなっても分かりやすさを重視する。

### クラスに持たせた責任範囲
- DrinkVendingMachineクラス
　券売機に入れる商品の設定をする。

- VendingMachineクラス
　自動販売機に必要なメソッドを定義しており、処理の流れを管理している。

- SellingFunctionsモジュール
　販売に関するメソッドを定義している。

- StockManagementFunctionsモジュール
　在庫管理に関するメソッドを定義している。

- SalesManagementFunctionsモジュール
　売上管理に関するメソッドを定義している。

### クラスに持たせた責任とその理由
このプログラムの変更や更新を考える場合、変更内容を分類すると「扱う商品を変更する」「処理の順番を変更する」「処理内容自体を変更する」の3パターンになると予想し、それぞれが独立している方が変更が容易だと考えた。

1. DrinkVendingMachineクラスの責任
　扱う商品の情報を管理する。

現実の自動販売機では、飲み物だけでなくタバコやお菓子の自動販売機も存在するため、VendingMachineクラスには自動販売機に必要な機能を持たせ、VendingMachineクラスの継承先（今回はDrinkVendingMachineクラス）で商品を登録する仕様にした。

2. VendingMachineクラスの責任
　自動販売機で行われる処理の流れを管理する。

3. SellingFunctionsモジュール
　販売に関するメソッドを定義している。

4. StockManagementFunctionsモジュール
　在庫管理に関するメソッドを定義している。

5. SalesManagementFunctionsモジュール
　売上管理に関するメソッドを定義している。

VendingMachineクラスには販売モードと管理モードを用意しているが、どちらかのモードで不具合が発生したり変更が必要になった場合、変更対象が分かりやすいようにモードごとにモジュールを作成した。


### こだわりのポイント
- できる限り実際の自動販売機の利用手順と同じ流れになるように作成した。
- 商品の変更に対応できるようにした。


### 疑問点
1. オブジェクト指向にのっとった設計とは？

どのように設計すれば再利用性や保守性が高くなるかがわからなかった。
設計をする際のポイントや考え方、こつなどは？

2. 初心者がリファクタリング時に考えるべきポイントは？

リファクタリングで目指すべき姿は、
- コードを他の人が見た際に、短時間で簡単に仕様を理解できること
- コードや仕様をアップデートする際に、修正箇所が少ないこと
すなわち保守性が高い状態、という理解をしている。

しかしリファクタリングをするにも引き出しが少ないためにできることが少なく、リファクタリングしながら保守性が高い状態に近づいているかもわからなかった。

分かりやすいコードを書くためにまず初心者が気をつけることは？
