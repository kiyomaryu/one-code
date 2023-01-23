defmodule MyApp.Application do
  # alias MyApp.Application
  use Application

  def start(_type, _args) do
    opts = [strategy: :one_for_one, name: MyApp.Supervisor]
    # children = []
    children = [{MyApp.GenServer,[]}] # 子にGenServerモジュールを追加
    Supervisor.start_link(children, opts)
    end
end
