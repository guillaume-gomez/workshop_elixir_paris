defmodule FindNumberWeb.CounterLive do
  use Phoenix.LiveView

  def render(assigns) do
    ~L"""
    <h1>Countasdasder</h1>

    <%= @value %>

    <button phx-click="increment">increment</button>
    <button phx-click="decrement">decrement</button>
    """
  end

  def mount(_session, socket) do
    {:ok, assign(socket, value: 0)}
  end

  def handle_event("increment", _, %{assigns: %{value: value}} = socket) do
    socket = assign(socket, :value, value + 1)
    {:noreply, socket}
  end

  def handle_event("decrement", _, %{assigns: %{value: value}} = socket) do
    socket = assign(socket, :value, value - 1)
    {:noreply, socket}
  end

  # def handle_info(:update, socket) do
  #   {:ok, temperature} = Thermostat.get_reading(socket.assigns.id)
  #   {:noreply, assign(socket, :temperature, temperature)}
  # end
end
