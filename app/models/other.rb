class Other < ApplicationRecord
  belongs_to :alcohol, inverse_of: :other
  def to_s
    "kind: #{self.kind}"    
  end
end
