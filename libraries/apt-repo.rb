module AptRepo
  # ugly hack to prevent resource cloning
  def self.dont_clone_resource(recipe, resource_type, resource_name, &block)
    recipe.resources(resource_type => resource_name)
  rescue Chef::Exceptions::ResourceNotFound
    # Chef uses method missing magic
    recipe.method_missing(resource_type, resource_name, &block)
  end
end
