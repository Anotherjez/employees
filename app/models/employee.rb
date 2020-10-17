class Employee < ApplicationRecord
    default_scope { order(created_at: :desc) }
    
    validates :cedula, presence: true
    validates :position, presence: true

end
