defmodule Iris.ModelPredictor do
  @moduledoc false

  alias Iris.PythonHelper, as: Helper


  @path 'lib/iris/model'


  def predict(args) do
    call_python(:classifier, :predict_model, args)
  end

  @doc """

  Communicates with the python module using the helper functions
  in python_helper.ex
  """
  defp call_python(module, func, args) do
    pid = Helper.py_instance(Path.absname(@path))
    result = Helper.py_call(pid, module, func, args)

    pid
    |> Helper.py_stop()

    result
  end
end
