# AwsLambdaContainer

Lambda上でコンテナとしてElixirを実行するためのサンプルです。

## ローカルでコンテナのテストをする場合
```
# AWSのKEYを環境変数にセット
export AWS_ACCESS_KEY_ID=xxxxxxxx
export AWS_SECRET_ACCESS_KEY=xxxxxxxx

# lambdaで動かす用のelixirが入ったコンテナをビルド
bash builder.sh $AWS_ACCESS_KEY_ID $AWS_SECRET_ACCESS_KEY

# ローカル実行
docker run --rm -p 9000:8080 aws_lambda_container:latest
```
lambdaに対するリクエストのサンプル
```
curl -XPOST "http://localhost:9000/2015-03-31/functions/function/invocations" -d '{"foo":"bar"}'
```

## lambdaにデプロイ

//TODO 環境変数周りの取り扱いに注意



## 参考情報
- https://qiita.com/erin/items/2aa7a70c34b0b2a64e5b
- https://inokara.hateblo.jp/entry/2017/12/17/150033#list_buckets-%E3%82%92%E5%AE%9F%E8%A1%8C
- https://qiita.com/RyoWakabayashi/items/53d831e4e6ff3ad056c8
- https://zenn.dev/ten_takano/articles/20210223-mix-exs
- https://github.com/ex-aws/ex_aws
- https://hub.docker.com/r/erintheblack/elixir-lambda-builder/tags
