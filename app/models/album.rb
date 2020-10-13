class Album < ApplicationRecord
  has_many :songs, dependent: :destroy

  # Validations
  validates :name, presence: true
  validates_length_of :name, maximum: 100

  # Callbacks
  before_save(:titleize_album)

  private
    def titleize_album
      self.name = self.name.titlecase
    end

end