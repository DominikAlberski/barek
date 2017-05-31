class Vodka < ApplicationRecord
  belongs_to :alcohol, inverse_of: :vodka
  def to_s
    "kind: #{self.kind}"
  end
end
