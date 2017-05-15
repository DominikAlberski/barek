class Whiskey < ApplicationRecord
  belongs_to :alcohol
  def to_s
    "age: #{self.age}
    region: #{self.region}
    kind: #{self.kind}
    cask nr: #{self.cask}
    description: #{self.description}"
  end
end
