# TODO iex -S mixで呼ばれるconfig
import Config

config :ex_aws, :s3,
  debug_requests: true,
  access_key_id: [{:system, "AWS_ACCESS_KEY_ID"}, :instance_role],
  secret_access_key: [{:system, "AWS_SECRET_ACCESS_KEY"}, :instance_role],
  region: "ap-northeast-1"
