# TODO: もっときれいにできるけど一旦はこれで。ここがS3だったりcloudfrontのcnameだったりroute53のホストゾーンとかになる
defmodule Utils do
  def fetch_domain_name({search_word,profile}) do
    System.cmd("bash", ["-c","aws s3 ls --profile=#{profile}| awk '{print $3}'"])
    |> elem(0)
    |> String.split("\n")
    |> Enum.each(
      fn(s) ->
        if Regex.run(~r/#{search_word}/, s) do
          IO.puts(s <> " #{profile}")
        end
      end
    )
  end
end

# 標準入力に検索したいドメイン名を入れる(部分一致可能)
args = IO.gets "domain name: "
search_word =  String.replace(args,"\n","")

# TODO: 本当は~/.aws/credentialsからプロファイル名を取得するようにしたい
profiles = ["default","default","default","default","default"]

# ここで並行処理をして実行する。
# プロファイル名のリストからAWSへの問い合わせをする関数をTaskが実行するために無名関数のリストとしてmapにする。
# それをtaskが並列に実行してくれる感じ。
timeout = 10000 # millisecond(ms)
profiles
|> Enum.map(fn(profile) ->
  fn -> Utils.fetch_domain_name({search_word,profile}) end
end )
|> Enum.map( &Task.async(&1) )
|> Enum.map( &Task.await(&1,timeout) )

# Task basic sample
# [
#   fn -> Utils.fetch_domain_name({domain,"default"}) end,
#   fn -> Utils.fetch_domain_name({domain,"default"}) end
# ]
# |> Enum.map( &Task.async(&1) )
# |> Enum.map( &Task.await(&1,10000) )
