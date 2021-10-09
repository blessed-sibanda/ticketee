RSpec.configure do |config|
  config.include Warden::Test::Helpers, type: :feature
  config.include Warden::Test::Helpers, type: :request
  config.after(type: :feature) { Warden.test_reset! }
end
