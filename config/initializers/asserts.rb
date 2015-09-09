# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
# config/initializers/assets.rb
#Rails.application.config.assets.paths << Rails.root.join("lib", "videoplayer", "flash")
Rails.application.config.assets.precompile << Proc.new do |path|
  if path =~ /\.(css|js|png|woff|eot|svg|ttf|otf)\z/
    full_path = Rails.application.assets.resolve(path).to_s
    app_assets_path = Rails.root.join('app', 'assets').to_s
    vendor_assets_path = Rails.root.join('vendor', 'assets').to_s
    if full_path.starts_with?(app_assets_path) || full_path.starts_with?(vendor_assets_path)
      puts "including asset: " + full_path
      true
    else
      puts "excluding asset: " + full_path
      false
    end
  else
    false
  end
end