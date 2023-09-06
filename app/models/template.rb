class Template < ApplicationRecord
    has_one :portfolio

    enum type: {
        beginner: 'beginner',
        intermediate: 'intermediate',
        advanced: 'advanced'
    }
end
