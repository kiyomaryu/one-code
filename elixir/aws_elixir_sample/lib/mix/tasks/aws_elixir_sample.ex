defmodule Mix.Tasks.AwsElixirSample do
  use Mix.Task # Mix.Taskモジュールを利用して現在のモジュールの定義を変更

  def run(_) do
    Mix.Task.run("app.start")   # 明示的にMixのアプリケーションと依存関係の解決を実行
    ## ここに実行したい処理を書いていく ##
    ## 注意: モジュールはlib配下にファイルを配置して、それをここから呼び出すこともできる
    ## 例：lib/elixir_task_sample.ex内に定義したgreeting関数を呼び出す場合
    ## ElixirTaskSample.greeting()

    client = AWS.Client.create("xxxx", "xxxx", "us-east-1")
    {:ok, result, resp} = AWS.S3.list_buckets(client)
    # S3
    bucket_list = result["ListAllMyBucketsResult"]["Buckets"]["Bucket"]
    Enum.each(bucket_list, fn(s) -> IO.puts(s["Name"]) end)
    # CloudFront
    # {:ok, result, resp} = AWS.CloudFront.list_distributions(client)
    # dist_list = result["DistributionList"]
    # Enum.each(dist_list, fn(s) -> IO.puts(s["Items"]["DistributionSummary"]["Aliases"]["Items"]["CNAME"]) end)
  end
end
