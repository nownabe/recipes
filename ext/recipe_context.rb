module ::MItamae
  class RecipeContext
    def home
      ENV["HOME"]
    end

    def user
      ENV["USER"]
    end
  end
end
