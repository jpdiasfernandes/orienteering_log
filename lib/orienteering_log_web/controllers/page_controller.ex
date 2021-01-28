defmodule OrienteeringLogWeb.PageController do
  use OrienteeringLogWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
