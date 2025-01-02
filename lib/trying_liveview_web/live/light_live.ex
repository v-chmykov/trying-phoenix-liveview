defmodule TryingLiveviewWeb.LightLive do
  use TryingLiveviewWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, assign(socket, :brightness, 10)}
  end

  def render(assigns) do
    ~H"""
    <div class="container">
      <h1>Light Brightness: {@brightness}</h1>
      <div id="light">
        <div class="meter">
          <span style={"width:#{@brightness}%"}></span>
        </div>

        <button phx-click="on">On</button>
        <button phx-click="off">Off</button>
        <button phx-click="up">Up</button>
        <button phx-click="down">Down</button>
      </div>
    </div>
    """
  end

  def handle_event("on", _value, socket) do
    {:noreply, assign(socket, :brightness, 100)}
  end

  def handle_event("off", _value, socket) do
    {:noreply, assign(socket, :brightness, 0)}
  end

  def handle_event("up", _value, socket) do
    brightness = socket.assigns.brightness + 10
    {:noreply, assign(socket, :brightness, min(brightness, 100))}
  end

  def handle_event("down", _value, socket) do
    brightness = socket.assigns.brightness - 10
    {:noreply, assign(socket, :brightness, max(brightness, 0))}
  end
end
