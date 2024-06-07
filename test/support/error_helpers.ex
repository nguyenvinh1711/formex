defmodule Formex.TestErrorHelpers do
  @moduledoc """
  Conveniences for translating and building error messages.
  """

  # import Phoenix.HTML
import Phoenix.HTML.Form
use PhoenixHTMLHelpers

  @doc """
  Translates an error message using gettext.
  """
  def translate_error({msg, _opts}) do
    msg
  end
end
