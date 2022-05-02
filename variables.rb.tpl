$env = Hashie::Mash.new(
  git: {
    user: "",
    email: "",
    additional_github_users: [],
  },
  github: {
    user: "",
    gpg_key_id: "",
    token: "",
  },
  gitlab: {
    token: "",
  },
  ruby: {
    rubygems_api_key: "",
  },
)
