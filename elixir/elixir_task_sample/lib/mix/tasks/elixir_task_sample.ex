defmodule Mix.Tasks.ElixirTaskSample do
  use Mix.Task # Mix.Taskモジュールを利用して現在のモジュールの定義を変更

  def run(_) do
    Mix.Task.run("app.start")   # 明示的にMixのアプリケーションと依存関係の解決を実行
    ElixirTaskSample.greeting() # ElixirTaskSampleモジュールのgreeting関数を呼び出し
    ElixirTaskSample.fetch() |> IO.puts() 
  end
end
