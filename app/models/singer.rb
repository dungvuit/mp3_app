class Singer < ApplicationRecord
  scope :sort_by_create_at, -> { order created_at: :desc }
  scope :search_by_name, ->(search) { where 'name LIKE ?', "%#{search}%" }

  validates :name, presence: true
  validates_presence_of :picture
  validates :date_of_birth, presence: true
  validate :validate_on_create

  has_many :songs, through: :singer_songs
  has_many :singer_songs, dependent: :destroy

  has_many :album, dependent: :nullify
  mount_uploader :picture, PictureUploader

  enum gender: { male: 0, female: 1 }

  class << self
    def to_csv(options = {})
      CSV.generate options do |csv|
        csv << column_names
        all.each do |singer|
          csv << singer.attributes.values_at(*column_names)
        end
      end
    end

    def index_singers(params)
      if params[:search].present?
        Singer.search_by_name(params[:search])
      else
        Singer.sort_by_create_at
      end.paginate page: params[:page], per_page: 5
    end
  end

  def validate_on_create
    return unless date_of_birth.present? && date_of_birth > 10.years.ago.to_date
    errors.add :date_of_birth, 'You should be over 10 years old.'
  end
end
