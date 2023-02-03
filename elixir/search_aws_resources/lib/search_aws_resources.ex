defmodule SearchAwsResources do

  # TODO: 検索箇所は共通かできるのでのちほど別のプライベート関数にまとめる
  def search_route53_hostzones({search_word,profile}) do
    # リソースが存在しないAWSアカウントも検索するので標準エラー出力はdev/nullに流して握りつぶしてる
    System.cmd("bash", ["-c","/usr/local/bin/aws route53 list-hosted-zones-by-name --profile #{profile} 2>/dev/null | jq '.HostedZones[].Name' 2>/dev/null"])
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

  def search_cloudfront_cname({search_word,profile}) do
    # リソースが存在しないAWSアカウントも検索するので標準エラー出力はdev/nullに流して握りつぶしてる
    System.cmd("bash", ["-c","/usr/local/bin/aws cloudfront list-distributions --profile #{profile} 2>/dev/null | jq '.DistributionList.Items[].Aliases.Items[]' 2>/dev/null"])
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
