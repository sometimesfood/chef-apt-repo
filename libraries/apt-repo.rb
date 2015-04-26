module AptRepo
  # ugly hack to prevent resource cloning
  def self.dont_clone_resource(recipe, type, name, &block)
    recipe.resources(type => name)
  rescue Chef::Exceptions::ResourceNotFound
    # Chef uses method missing magic
    recipe.method_missing(type, name, &block)
  end
end
