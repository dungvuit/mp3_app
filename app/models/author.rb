class Author < ApplicationRecord
  scope :sort_by_create_at, -> { order created_at: :desc }
  scope :search_by_name, ->(search) { where 'name LIKE ?', "%#{search}%" }

  validates :name, presence: true

  has_many :songs, dependent: :nullify

  class << self
    def to_csv(options = {})
      CSV.generate options do |csv|
        csv << column_names
        all.each do |author|
          csv << author.attributes.values_at(*column_names)
        end
      end
    end

    def index_authors(params)
      if params[:search].present?
        Author.search_by_name(params[:search])
      else
        Author.sort_by_create_at
      end.paginate page: params[:page], per_page: 10
    end
  end
end
