# frozen_string_literal: true

desc "Using rubocop for format overrall project"
task format: :environment do
  exec "./bin/rubocop -A ."
end
