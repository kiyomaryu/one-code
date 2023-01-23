defmodule MyApp.GenServer do
  use GenServer

  def start_link(state) do
    GenServer.start_link(__MODULE__, state, name: __MODULE__)
  end

  def init(state) do
    send(self(), :hello)
    {:ok, state}
  end

  def handle_info(:hello, state) do
    IO.puts("hello")
    Process.send_after(self(), :hello, 5000)
    {:noreply, state}
  end
end
