Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins(*ENV.fetch("ALLOW_REQUESTS_FROM", app_config.host).split(","))

    resource "*",
      headers: :any,
      methods: %i[get post put delete patch options head]
  end
end
