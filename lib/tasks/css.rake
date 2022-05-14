# rubocop:disable Rails/RakeEnvironment
# frozen_string_literal: true

Rake::Task["css:build"].clear

namespace :css do
  desc "Build your CSS bundle"
  task :build do
    unless system("yarn install && yarn css:build")
      raise "Command css:build failed, ensure yarn is installed and " \
              "`yarn css:build` runs without errors"
    end
  end

  desc "Continuously build your CSS bundle as files change"
  task :watch do
    unless system("yarn install && yarn css:watch")
      raise "Command css:watch failed, ensure yarn is installed and " \
              "`yarn css:watch` runs without errors"
    end
  end
end
