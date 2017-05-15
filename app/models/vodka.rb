class Vodka < ApplicationRecord
  belongs_to :alcohol
  def to_s
    "kind: #{self.kind}"
  end
end
