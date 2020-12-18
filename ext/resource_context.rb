module ::MItamae
  class ResourceContext
    def home
      ENV["HOME"]
    end

    def username
      ENV["USER"]
    end
  end
end
