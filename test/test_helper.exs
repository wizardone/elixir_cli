ExUnit.start()

#import FakeHTTPoison
defmodule FakeHTTPoison do

  defmodule Response do
    defstruct status_code: 200, body: ""
  end

  defmodule Error do
    defstruct reason: "WAT?"
  end
end

Mox.defmock(FakeHTTPoison, for: HTTPoison)
