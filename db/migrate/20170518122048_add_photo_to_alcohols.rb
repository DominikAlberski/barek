class AddPhotoToAlcohols < ActiveRecord::Migration[5.1]
    def self.up
      add_attachment :alcohols, :photo
    end

    def self.down
      remove_attachment :alcohols, :photo
    end
end
