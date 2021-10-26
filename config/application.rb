require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Naganocake
  class Application < Rails::Application
    config.i18n.default_locale = :ja
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # 日本語対応
    config.i18n.default_locale = :ja
    config.i18n.load_path += Dir[Rails.root.join('config/locales/*.yml').to_s]

    # 日本時間に変更
    config.time_zone = 'Asia/Tokyo'

  end
end

