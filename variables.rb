$env = Hashie::Mash.new(
  git: {
    user: ENV.fetch("GIT_USER"),
    email: ENV.fetch("GIT_EMAIL"),
    gpg_key_id: ENV.fetch("GIT_GPG_KEY_ID"),
    additional_github_users: ENV.fetch("GIT_ADDITIONAL_GITHUB_USERS", "").split(","),
  },
  github: {
    token: ENV.fetch("GITHUB_PAT", ""),
  },
  gitlab: {
    token: ENV.fetch("GITLAB_TOKEN"),
  },
  ruby: {
    rubygems_api_key: ENV.fetch("RUBY_RUBYGEMS_API_KEY"),
  },
)
