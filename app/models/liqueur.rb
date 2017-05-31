class Liqueur < ApplicationRecord
    belongs_to :alcohol, inverse_of: :liqueur
    def to_s
      "kind: #{self.kind}"
    end
end
