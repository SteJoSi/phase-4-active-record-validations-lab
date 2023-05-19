class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction) }

    validate :is_clickbait_enough

    def is_clickbait_enough
        if title.present? && title.exclude?("Won't Believe" || "Secret" || "Top" || "Guess")
            errors.add(:title, "Needs more clickbait!")
        end
    end
end
