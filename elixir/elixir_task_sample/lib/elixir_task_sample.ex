defmodule ElixirTaskSample do
  def greeting do
    IO.puts("Hello Kiyomaru!")
  end

  def fetch do
    HTTPoison.get!("https://kiyomaru.me").body # 外部のHTTPoisonモジュールを使ってアクセス
  end

end
