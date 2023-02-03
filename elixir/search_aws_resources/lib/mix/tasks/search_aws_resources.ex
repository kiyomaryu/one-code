defmodule Mix.Tasks.SearchAwsResources do

  use Mix.Task # Mix.Taskモジュールを利用して現在のモジュールの定義を変更

  def run(_) do
    Mix.Task.run("app.start")   # 明示的にMixのアプリケーションと依存関係の解決を実行

    # 標準入力に検索したいドメイン名を入れる(部分一致可能)
    IO.puts "Please select search mode."
    IO.puts "[1] route53 hostzones.\n[2] cloudfront cnames."
    t_mode = IO.gets "mode?: "
    mode = String.replace(t_mode,"\n","")

    IO.puts "Please input search word."
    t_search_word = IO.gets "word?: "
    search_word =  String.replace(t_search_word,"\n","")

    # ~/.aws/credentialsからプロファイル名を取得する
    profiles = System.cmd("bash",["-c", ~S(/bin/cat ~/.aws/credentials | grep "^\[" | sed "s/\[//" | sed "s/\]//") ]) |> elem(0) |> String.split("\n")

    # プロファイル名のリストからAWSへの問い合わせをする関数をTaskが実行するために無名関数のリストとしてmapに入れてtaskが並行に実行
    timeout = 10000 # タスクのタイムアウト値 (ms)

    # TODO: イケてないので共通化できるところはする、一旦は動かす
    cond do
      mode == "1" ->
        profiles
        |> Enum.map(fn(profile) ->
          fn -> SearchAwsResources.search_route53_hostzones({search_word,profile}) end
        end )
        |> Enum.map( &Task.async(&1) )
        |> Enum.map( &Task.await(&1,timeout) )

      mode == "2" ->
        profiles
        |> Enum.map(fn(profile) ->
          fn -> SearchAwsResources.search_cloudfront_cname({search_word,profile}) end
        end )
        |> Enum.map( &Task.async(&1) )
        |> Enum.map( &Task.await(&1,timeout) )
    end
  end
end
