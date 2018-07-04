ExUnit.start()

defmodule TravisCli.FakeTravisApi do
  @behaviour TravisCli.TravisApiBehaviour
  def get_user('user') do
    'haha'
  end
end

Mox.defmock(TravisCli.FakeTravisApi, for: TravisCli.TravisApi)
