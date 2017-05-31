class Wine < ApplicationRecord
  belongs_to :alcohol, inverse_of: :wine
  def to_s
    "kind: #{self.kind}
    color: #{self.color}"
  end
end
