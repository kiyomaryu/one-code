# 標準入力に検索したいドメイン名を入れる(部分一致可能)
args = IO.gets "domain name: "
domain =  String.replace(args,"\n","")

# TODO: 本当は~/.aws/credentialsからプロファイル名を取得するようにしたい
_profiles = ["default","default"]

# TODO: もっときれいにできるけど一旦はこれで。ここがS3だったりcloudfrontのcnameだったりroute53のホストゾーンとかになる
defmodule Utils do
  def fetch_domain_name(x,y) do
    System.cmd("bash", ["-c","aws s3 ls --profile=#{y}| awk '{print $3}'"])
    |> elem(0)
    |> String.split("\n")
    |> Enum.each(
      fn(s) ->
        if Regex.run(~r/#{x}/, s) do
          IO.puts(s <> " #{y}")
        end
      end
    )
  end
end

# 仮でプロファイルは手打ちしてみてる
# ここで並行処理をして実行する。今はdefaultプロファイルしかないのでこんな感じ
[
  fn -> Utils.fetch_domain_name(domain,"default") end,
  fn -> Utils.fetch_domain_name(domain,"default") end,
  fn -> Utils.fetch_domain_name(domain,"default") end,
  fn -> Utils.fetch_domain_name(domain,"default") end,
  fn -> Utils.fetch_domain_name(domain,"default") end,
  fn -> Utils.fetch_domain_name(domain,"default") end,

]
|> Enum.map( &Task.async(&1) )
|> Enum.map( &Task.await(&1) )
