class Wine < ApplicationRecord
  belongs_to :alcohol
  def to_s
    "kind: #{self.kind}
    color: #{self.color}"
  end
end
