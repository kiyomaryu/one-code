# SearchAwsResources
このツールは複数のAWSアカウントにてどこのアカウントにリソースが存在するかを検索するものです。

## Preparation

### aws cliのインストール

下記の公式手順にてインストールをお願いします

- [aws cliのインストール方法](https://docs.aws.amazon.com/ja_jp/cli/latest/userguide/getting-started-install.html)

### ~/.aws/credentialsの記載

基本的にassume_roleで一つのIAMアカウントで複数AWSアカウントのリソースを操作することを想定しています。

例:
```
[basic]
aws_access_key_id = xxxx
aws_secret_access_key = xxxx
[default]
aws_access_key_id = xxxx
aws_secret_access_key = xxxx
[profile1]
role_arn = arn:aws:iam::xxxxxxxxxx:role/OrganizationAccountAccessRole
source_profile = basic
[profile2]
role_arn = arn:aws:iam::xxxxxxxxxx:role/OrganizationAccountAccessRole
source_profile = basic
```

### バージョン管理ツールasdfのインストール

下記の公式手順にてインストールをお願いします

- [asdfインストール手順](https://asdf-vm.com/guide/getting-started.html)
```

```
### elixirのインストール

asdfにてインストールします
```
asdf plugin-add elixir
asdf plugin-add erlang
cat << EOF > ~/.tool-versions
erlang 25.0.4
elixir 1.13.4-otp-25
EOF
asdf install
```

## Usage

下記のコマンドにて実行します
検索ワードは部分一致なのでドメインの一部だけわかるとかでも検索できます。
並行実行するのでそこそこのはやさがでます。

検索結果にはマッチした文字列と該当するプロファイル名が出力されます。
```
mix deps.get
mix search_aws_resources
---ここから実行サンプル---
Please select search mode.
[1] route53 hostzones.
[2] cloudfront cnames.
mode?: 2
Please input search word.
word?: kiyo
"kiyomaru.example.com" profile1
```
