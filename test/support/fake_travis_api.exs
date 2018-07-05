defmodule TravisCli.FakeTravisApi do
  @behaviour TravisCli.TravisApi
  def get_user('user') do
    'haha'
  end
end
