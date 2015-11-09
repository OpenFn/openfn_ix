defmodule OpenfnIx.Mailer do
  @behaviour PhoenixTokenAuth.MailingBehaviour

  def welcome_subject(user, _) do
    "Welcome to OpenFN, #{user.email}"
  end

  def welcome_body(_, token, _) do
    "Your token is #{token}"
  end
end
