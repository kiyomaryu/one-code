# ElixirTaskSample

## コマンドラインツール的に使いたい場合

mix taskとして定義するとちょっとしたコード書くときに便利

### 実行準備
```
## 必須
mix new elixir_task_sample
cd elixir_task_sample
mkdir lib/mix/tasks
touch elixir_task_sample.ex
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

```
# 外部モジュールを使う場合はここで定義して取り込み
vim mix.exs
mix deps.get
```

### 実行方法
```
mix elixir_task_sample
```