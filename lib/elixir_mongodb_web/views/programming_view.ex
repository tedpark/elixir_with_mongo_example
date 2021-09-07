defmodule ElixirMongodbWeb.ProgrammingView do
  use ElixirMongodbWeb, :view
  alias ElixirMongodbWeb.ProgrammingView

  def render("index.json", %{programmings: programmings}) do
    %{data: render_many(programmings, ProgrammingView, "programming.json")}
  end

  def render("show.json", %{programming: programming}) do
    %{data: render_one(programming, ProgrammingView, "programming.json")}
  end

  def render("programming.json", %{programming: programming}) do
    %{id: programming.id,
      name: programming.name}
  end
end
