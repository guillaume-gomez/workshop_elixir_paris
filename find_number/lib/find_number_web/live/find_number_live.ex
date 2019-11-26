defmodule FindNumberWeb.FindNumberLive do
  use Phoenix.LiveView

  def render(assigns) do
    ~L"""
    <h1>Find Number</h1>
    <p> <%= @message %> </p>
    <p> <%= @nb_attempts %>  </p>
    <form phx-submit="save">
        <input type="text" name="attempt"></input>
        <button type=submit">valider</button>
    </form>
    """
  end

   def mount(_session, socket) do
    random_number = :rand.uniform(10000)
    IO.inspect(random_number)
    {:ok, assign(socket, random_number: random_number, nb_attempts: 10, message: "" )}
  end

  def handle_event(
    "save",
    %{"attempt" => attempt} = args,
    %{assigns: %{random_number: random_number, nb_attempts: nb_attempts }} = socket) do

    {int_attempt, _}  = Integer.parse(attempt)
    message = case compare(random_number,int_attempt) do
        :minus -> "c'est moins"
        :plus -> "c'est plus"
        :equal -> "tu as gagné"

    end
    update_socket = assign(socket, %{ nb_attempts: (nb_attempts - 1), message: message })
    {:noreply, update_socket}
  end

  def compare(random_number, attempt ) when random_number == attempt do
    :equal
  end

  def compare(random_number, attempt) when random_number > attempt do
    :plus
  end

  def compare(random_number, attempt), do: :minus
 
end
