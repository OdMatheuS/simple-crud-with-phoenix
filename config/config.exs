# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :bank_concept,
  ecto_repos: [BankConcept.Repo]

# Configures the endpoint
config :bank_concept, BankConceptWeb.Endpoint,
  url: [host: "localhost"],
  render_errors: [view: BankConceptWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: BankConcept.PubSub,
  live_view: [signing_salt: "B8KFCHHV"]

# Configures the mailer
#
# By default it uses the "Local" adapter which stores the emails
# locally. You can see the emails in your browser, at "/dev/mailbox".
#
# For production it's recommended to configure a different adapter
# at the `config/runtime.exs`.
config :bank_concept, BankConcept.Mailer, adapter: Swoosh.Adapters.Local

# Swoosh API client is needed for adapters other than SMTP.
config :swoosh, :api_client, false

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"

config :bank_concept, BankConceptWeb.Auth.Guardian,
  issuer: "bank_concept",
  secret_key: "1Ki9D5XKQJja3o0nhlF3WuRLav0crZkbrT0w57bDapE6zOw6x4iMzk8owbj9t4i8"

config :bank_concept, BankConceptWeb.Auth.Pipeline,
  module: BankConceptWeb.Auth.Guardian,
  error_handler: BankConceptWeb.Auth.ErrorHandler
