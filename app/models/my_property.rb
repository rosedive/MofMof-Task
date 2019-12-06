class MyProperty < ApplicationRecord
    has_many :statons, dependent: :destroy
    validates :property, :rent, :adress,
        :building_age, presence: true
    validates :rent, numericality: true   
    accepts_nested_attributes_for :statons, reject_if: :all_blank, :allow_destroy => true
        def check
            if how_many_minutes_walks.present? && how_many_minutes_walks1.present?
                if how_many_minutes_walks <= how_many_minutes_walks1
                    errors.add(:how_many_minutes_walks, 'not perfect')
                end
            end
        end
end
