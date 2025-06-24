class Actor < ApplicationRecord
    validates :name, presence: true
    validates :birth_date, presence: true
    validates :height, presence: true,numericality: true, numericality: { greater_than: 50, less_than: 300 }
    validates :weight, allow_blank: true, numericality: { greater_than: 0, less_than: 500 }
    validates :gender,presence: true, inclusion: { in: ['male', 'female'] }
    validates :blood_type, allow_blank: true, inclusion: { in: ['A', 'B', 'AB', 'O'] }
end
