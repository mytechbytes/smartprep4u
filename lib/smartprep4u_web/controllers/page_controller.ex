defmodule SmartPrep4UWeb.PageController do
  use SmartPrep4UWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end
