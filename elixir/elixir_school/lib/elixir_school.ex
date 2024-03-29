# Exlir Schoolなどのサンプル置き場です
# https://elixirschool.com/ja/lessons/basics/basicst/

###################################
# 文法とか基本的なとこ
###################################
# 文字列を結合して表示
IO.puts "hello" <> " " <> "world"

# 変数との束縛を色々実験中
num_1 = 10 / 2            # 割り算結果
f = fn -> num_1 end       # 無名関数を変数fに束縛
num_1 = 23                # これは再代入じゃなくて再束縛をしている。もし再束縛したくなくてパターンマッチしたいときはピン演算子^を変数名につけてマッチして判定
IO.puts f.()              # 再束縛なので無名関数を束縛している変数fの戻り値は、はじめに束縛したnum_1変数を参照し続けている 5が表示
_num_2 = div(10,2)        # 使わない変数なので_つけてる
_result = (1 + 2) * 3 - 4 # 同上

# 浮動小数
float_1 = 3.14            # 浮動小数点
float_2 = 1.0e-10         # こんな表現もできる
IO.puts float_1
IO.puts float_2

############################
# アトムはrubyのシンボルと同じ
############################
# シンボルは内部的には数値として認識されるもの。人が読みやすいようにシンボルというラベルで表現されている
IO.puts "====atom===="
atom_near_symbol_1 = :kiyomaru         # atom_near_symbol_1にアトム:kiyomaruを束縛
IO.puts is_atom(atom_near_symbol_1)    # アトムかどうか判定(ture)
IO.puts is_boolean(atom_near_symbol_1) # boolean判定は(false)
atom_near_symbol_2 = true              # 真偽値のture or falseは実はアトムの:true :falseである
IO.puts is_atom(atom_near_symbol_2)    # 上の理由からアトム判定をするとtrueになる
IO.puts is_boolean(atom_near_symbol_2) # boolean判定もtrue
atom_near_symbol_3 = false              # 真偽値のture or falseは実はアトムの:true :falseである
IO.puts is_atom(atom_near_symbol_3)    # 上の理由からアトム判定をするとtrueになる
IO.puts is_boolean(atom_near_symbol_3) # boolean判定もtrue
IO.puts is_atom(MyApp.MyModule)        # 加えてモジュール名も実はアトム。モジュールは定義されてなくても名前がアトムなのでここではtrueになる
atom_kiyomaru = :kiyomaru
IO.puts is_atom(atom_kiyomaru)
IO.puts atom_kiyomaru === :kiyomaru # アトム同士の比較結果はtrueとなる

######
# 比較
######
# Elixirの重要な特徴はどんな2つの型でも比べられるということで、これは特にソートにおいて有用です。ソートされる順序を覚える必要はありませんが、順序を気にするのは重要なことです
# number < atom < reference < function < port < pid < tuple < map < list < bitstring
IO.puts result = :hello > 999 # こんな感じに異なる型でも比較できて↑の順序で判定される

# 文字列展開　rubyと同じ
name_1 = "kiyomaru"
IO.puts "Hello #{name_1}"
# 文字列結合
name_2 = "kiyomaru"
new_name = "Hello" <> " " <> name_2
IO.puts new_name
# ファイル読み込み
res = File.read("/home/kiyomaru/kiyomaru.code-workspace")
a = elem(res,0)
IO.puts a
# Enumの活用。各要素に対して関数を適用している。これは各要素の文字列の長さを判定している
IO.puts Enum.all?(["foo", "bar", "hello"], fn(s) -> String.length(s) == 3 end)
IO.puts Enum.all?(["foo", "bar", "hello"], fn(s) -> String.length(s) > 1 end)

IO.puts "## loop start ##"
res2 = Enum.each(["one", "two", "three"], fn(s) -> IO.puts(s) end)
IO.puts "## loop end ##"
# 戻り値のアトムを取得
IO.puts res2

##########
# 条件分岐
##########
if String.valid?("kiyomaru") do
  IO.puts "Valid string!"
else
  IO.puts "Invalid string."
end
unless String.valid?("kiyomaru") do
  IO.puts "Valid string!"
else
  IO.puts "Invalid string."
end
case {:ok, "Hello World"} do
  {:ok, result} -> result
  {:error} -> "Oh.No!"
  _ -> "Catch All"
end

user = %{first: "Sean", last: "Callan"}
with {:ok, first} <- Map.fetch(user, :first),
     {:ok, last} <- Map.fetch(user, :last),
     do: last <> ", " <> first

sum = fn (a,b) -> (a + b) end
IO.puts sum.(2,3)

#############
# パイプ演算子
#############
check_result1 = "elixir" |> String.ends_with?("ixir")
IO.puts check_result1
"Elixir rocks" |> String.upcase() |> String.split() |> IO.puts

####################
# モジュールサンプル
####################
defmodule Kiyomaru do
  @greeting_word "Hello"
  def greeting(name) do
    "#{@greeting_word}" <> " #{name}" <> " san"
  end
end
IO.puts(Kiyomaru.greeting("asagi"))

defmodule Example do
  @moduledoc false
  ## モジュール属性はモジュール内で定数として使われることが多い
  @greeting "Hello"

  def greeting(name) do
    "#{@greeting} #{name}"
  end
end

defmodule Example.Greetings do
  def morning(name) do
    "Good morning #{name}"
  end
  def evening(name) do
    "Good night #{name}"
  end
end
Example.greeting("kiyomaru") |> IO.puts
Example.Greetings.morning("kiyomaru") |> IO.puts
Example.Greetings.evening("kiyomaru") |> IO.puts

###################################################
# コレクション(リスト、タプル、キーワードリスト、マップ)
###################################################
## リスト
# 複数の方を含むことができる
list = [3.14, :pie, "Apple"]
# リストの文字列と最後尾に文字を追加
list_add = ["abc" | list ] ++ ["efg"]
# リストの結合
list_conbine = ["he"] ++ ["llo"] = ["he"] ++ ["llo"]
list_hd = hd list_conbine # 戦闘の要素のみなのでリストではなく内部の要素自体
list_tail = tl list_conbine # 末尾の要素なのでリストで帰ってくる
# リストを先頭と末尾の残りの要素で分割した状態で変数にバインドできる
list_split = [head | tail] = [3.14, :pie, "Apple"]

## タプル(タプルはリストに似ていますが、各要素はメモリ上に隣接して格納されます) タプルは関数から補助的な情報を返す仕組みとしてよく利用されます
taple = {3.14, :pie, "Apple"}
taple_result = File.read("path/to/unknown/file")

## キーワードリスト(Elixirでは、キーワードリストは最初の要素がアトムのタプルからなる特別なリストで、リストと同様の性能になります:キーワードリストは関数にオプションを渡すために非常に良く用いられます。
keywordlist = [foo: "bar", hello: "world"]
keywordlist2 = [{:foo, "bar"}, {:hello, "world"}]
IO.puts keywordlist[:foo]

## マップ(キーワードリストとは違ってどんな型のキーも使え、順序付けされません。マップは %{} 構文で定義することができます
map = %{:foo => "bar", "hello" => :world}
map[:foo]
map.foo ## キーがアトムのときはこれでもアクセスできる

# 構造体(構造体は定義済みのキーの一群とデフォルト値を持つ特殊なマップ) 実質はマップなのでここに書いとく
defmodule Example.User do
  defstruct name: "Sean", roles: []

  def struct1 do # TODO この書き方いけてないしたぶんおかしいので後ほど修正
    %Example.User{} # ファイルにする場合はコンパイラの処理の順番の影響で構造体を定義していても下記の%Example.User{}時に構造体無いよって怒られる。なのでここでは明示的にモジュール定義してこの中で構造体を返す用にする
  end
  def struct2 do
    %Example.User{name: "Steve"}
  end
  def struct3 do
    %Example.User{name: "Steve", roles: [:manager]}
  end
end
struct_1 = Example.User.struct1()
struct_2 = Example.User.struct2()
struct_3 = Example.User.struct3()
sean = %{struct_2 | name: "Sean"} # マップみたいに同じキーがある場合は更新(新しいマップを生成)することができる
## もちろん構造体はmapにマッチできる。
# %{name: "Sean"} = sean

### 変数をキーにすることもできる
key = "hello"
hello_world_map = %{key => "world"}
IO.puts hello_world_map[key]
IO.puts hello_world_map["hello"] # keyは"hello"とバインドされているので、バインドされている文字列でもkeyのvalueを引くことができる
## 同じキーがmapに追加された場合は後勝ち
#%{:foo => "bar", :foo => "hello world"}
## アトムのキーだけを含んだマップには特別な構文
%{foo: "bar", hello: "world"} == %{:foo => "bar", :hello => "world"} # これがなんとtrueになる
## 特殊な動き
map = %{foo: "bar", hello: "world"}
%{map | foo: "baz"} # これで宣言するとfooが置き換わって新しいmapが生成される.同じキーがない場合はKeyErrorが発生する

#############
# 関数サンプル
#############
# 無名関数
unname_func = fn() -> "hoge" end
IO.puts(unname_func.())

# 無名関数テスト
sum = fn (a, b) -> a + b end
## 呼び出しは.つき
IO.puts sum.(1,2)
# 無名関数の省略記法。引数をそのまま&つけて計算に使える
sum2 = &(&1 + &2)
IO.puts sum2.(2,3)

#################
# 並行処理サンプル
#################
defmodule Parallel do
  @moduledoc false

  def pmap(collection, func) do
    collection
    |> Enum.map(&(Task.async(fn -> func.(&1) end)))
    |> Enum.map(&Task.await/1)
  end
end
# 時間かかるので現時点ではコメントアウトしておく
#_result = Parallel.pmap 1..10000, &(&1 * &1)

#################################
# 外部モジュールをインポートして実行
#################################
# 外部モジュールのインストール。mix deps.getに書いていてもスクリプト実行時には読み込まれないので内部でMix.installで無理やり入れてる
# 本来はApplicationとして定義して外部モジュールを使えるようにするのが良いが、このコードではあくまでスクリプトなので無理やり実行時にインストールしてる
Mix.install([{:httpoison, "~> 2.0"}]) # mix run スクリプトファイル名 を指定するとmix
# モジュール定義、実行
defmodule Utils.CurlTest do
  def fetch do
    HTTPoison.get!("https://kiyomaru.me").body
  end
end
IO.puts(Utils.CurlTest.fetch.())
