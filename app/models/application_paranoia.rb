# frozen_string_literal: true

class ApplicationParanoia < ApplicationRecord
  acts_as_paranoid
  self.abstract_class = true
end
