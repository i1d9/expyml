defmodule IrisWeb.PageController do
  use IrisWeb, :controller


  alias Iris.ModelPredictor, as: ML
  alias Iris.IrisParams, as: Iris

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def show(conn, %{
        "sepal_length" => sepal_length,
        "sepal_width" => sepal_width,
        "petal_length" => petal_length,
        "petal_width" => petal_width
      }) do
    with {sepal_length, _} <- Float.parse(sepal_length),
         {sepal_width, _} <- Float.parse(sepal_width),
         {petal_length, _} <- Float.parse(petal_length),
         {petal_width, _} <- Float.parse(petal_width) do
      class = ML.predict([[sepal_length, sepal_width, petal_length, petal_width]])

      IO.inspect(class)
      conn
      |> put_flash(:info, "Predicted class: #{class}")
      |> render("index.html")
    else
      _error ->
        conn
        |> put_flash(:error, "Invalid parameters!")
        |> render("index.html")
    end
  end
end
