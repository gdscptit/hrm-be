# frozen_string_literal: true

namespace :format do
  desc "Using rubocop for format overrall project"
  task all: :environment do
    exec "./bin/rubocop -A ."
  end
end
