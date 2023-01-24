# ElixirTaskSample

## コマンドラインツール的に使いたい場合

mix taskとして定義するとちょっとしたコード書くときに便利

### 実行準備

#### elixirをローカルにインストール済み
```
## 必須
mix new elixir_task_sample
cd elixir_task_sample
mkdir lib/mix/tasks
touch lib/mix/tasks/elixir_task_sample.ex
```

#### コンテナの場合

```
## 必須
docker run -it --rm --name elixir-container -v "$PWD":/usr/src/myapp -w /usr/src/myapp elixir mix new elixir_task_sample
sudo chown -R <ユーザ名>. ./elixir_task_sample
cd elixir_task_sample
mkdir lib/mix/tasks
touch lib/mix/tasks/elixir_task_sample.ex
```

#### elixir_task_sample.exの雛形

```
defmodule Mix.Tasks.ElixirTaskSample do
  use Mix.Task # Mix.Taskモジュールを利用して現在のモジュールの定義を変更

  def run(_) do
    Mix.Task.run("app.start")   # 明示的にMixのアプリケーションと依存関係の解決を実行
    ## ここに実行したい処理を書いていく ##
    ## 注意: モジュールはlib配下にファイルを配置して、それをここから呼び出すこともできる
    ## 例：lib/elixir_task_sample.ex内に定義したgreeting関数を呼び出す場合
    ## ElixirTaskSample.greeting()
    end
end
```

#### 外部モジュールを使う場合

#### elixirをローカルにインストール済みの場合のみ
```
# 外部モジュールを使う場合はここで定義して取り込み
vim mix.exs
mix deps.get
```

#### コンテナの場合
```
# 外部モジュールを使う場合はここで定義して取り込み
vim mix.exs
docker run -it --rm --name elixir-container -v "$PWD":/usr/src/myapp -w /usr/src/myapp elixir mix deps.get
```

### 実行方法
```
# elixirをローカルマシンにインストール済みの場合
mix elixir_task_sample
# コンテナ実行したい場合 ※この場合は毎回hexのinstallが聞かれるので嫌な場合は独自にdockerfile作ってそこで事前にいれておく
docker run -it --rm --name elixir-container -v "$PWD":/usr/src/myapp -w /usr/src/myapp elixir mix elixir_task_sample
```
