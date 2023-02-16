defmodule AwsLambdaContainer do
  use FaasBase, service: :aws # useの書き方としてこれはFaasBaseモジュールのuseを呼び出してoptsとしてservice: aws:っての入れて内部の関数を使える状態にしている。
  alias FaasBase.Logger # Logger.infoなどで呼び出せるようにするためのalias
  alias FaasBase.Aws.Request
  alias FaasBase.Aws.Response

  @impl FaasBase
  def init(context) do
    # call back one time
    {:ok, context}
  end

  @impl FaasBase
  def handle(%Request{body: body} = request, event, context) do
    Logger.info(request)
    Logger.info(event)
    Logger.info(context)

    ## S3にアクセスして一覧を取得
    json = ExAws.S3.list_buckets |> ExAws.request! |> Map.get(:body) |> Map.get(:buckets) |> Poison.encode!
    # response
    {:ok, Response.to_response(body |> String.upcase, %{}, 200)}

  end
end
