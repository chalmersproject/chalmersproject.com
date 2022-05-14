# rubocop:disable Rails/RakeEnvironment
# frozen_string_literal: true

Rake::Task["javascript:build"].clear

namespace :javascript do
  desc "Build your JS bundle"
  task :build do
    unless system("yarn install && yarn javascript:build")
      raise "Command javascript:build failed, ensure yarn is installed and " \
              "`yarn javascript:build` runs without errors"
    end
  end

  desc "Continuously build your JS bundle as files change"
  task :watch do
    unless system("yarn install && yarn javascript:watch")
      raise "Command javascript:watch failed, ensure yarn is installed and " \
              "`yarn javascript:watch` runs without errors"
    end
  end
end
