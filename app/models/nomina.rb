class Nomina < ApplicationRecord
    
    validates :age, presence: true
    validates :month, presence: true
    validate :anti_duplicate


    def anti_duplicate
        nominas = Nomina.where('age = ? and month = ?', self.age, self.month)
        if nominas.count > 0
            errors.add(:age, ", Esta nomina ya existe!")
        end
    end
end
