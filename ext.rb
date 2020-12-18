module MItamaeExt
  module UserContext
    def home
      ENV["HOME"]
    end

    def username
      ENV["USER"]
    end
  end
end

::MItamae::RecipeContext.prepend(MItamaeExt::UserContext)
::MItamae::ResourceContext.prepend(MItamaeExt::UserContext)
