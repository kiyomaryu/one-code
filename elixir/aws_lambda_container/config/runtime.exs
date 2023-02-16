# TODO lambdaで実行時に読まれるconfig
import Config

# モジュールのex_awsとs3に対して、debug_requests等を設定してる。実はdebug_requests移行はリストだけど[]が省略されてこんな感じ
config :ex_aws, :s3,
  debug_requests: true,
  access_key_id: [{:system, "AWS_ACCESS_KEY_ID"}, :instance_role],
  secret_access_key: [{:system, "AWS_SECRET_ACCESS_KEY"}, :instance_role],
  region: "ap-northeast-1"
