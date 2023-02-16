#!/bin/bash

# Usage
# bash builder.sh $AWS_ACCESS_KEY_ID $AWS_SECRET_ACCESS_KEY

ELIXIR_VERSION=1.14.0
MODULE_NAME="AwsLambdaContainer"
CONTAINER_NAME="aws_lambda_container"

rm -rf _build
mkdir -p _build
# elixirをlambdaで動かすためのbulder
docker run -d -it --rm --name elx erintheblack/elixir-lambda-builder:al2_${ELIXIR_VERSION}
docker cp mix.exs elx:/tmp
docker cp lib elx:/tmp
## configファイルも追加
docker cp config elx:/tmp
docker exec elx /bin/bash -c "mix deps.get; MIX_ENV=prod mix aws.release ${MODULE_NAME}"
docker cp elx:/tmp/_aws ./_build
docker stop elx

# dockerファイルに環境変数を設定(ローカル実行用)
cat <<EOF > ./_build/_aws/Dockerfile
FROM amazon/aws-lambda-provided:al2.2021.07.05.11

COPY docker/bootstrap /var/runtime/

COPY docker/ /var/task/

ENV AWS_ACCESS_KEY_ID=$1

ENV AWS_SECRET_ACCESS_KEY=$2

CMD [ "${MODULE_NAME}" ]
EOF

# lambdaにデプロイ用のコンテナをビルド
docker build -t ${CONTAINER_NAME}:latest ./_build/_aws/

# docker run --rm -p 9000:8080 aws_lambda_container:latest