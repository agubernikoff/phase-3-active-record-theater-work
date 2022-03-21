require 'pry'
class Role < ActiveRecord::Base
    has_many :auditions

    def actors
        self.auditions.map do |aud|
            aud.actor
        end
    end

    def locations
        self.auditions.map do |aud|
            aud.location
        end
    end

    def lead
        hired_actors=self.auditions.filter do |t|
            t.hired == true
        # binding.pry
        end
        hired_actors.first
    end

    def understudy
        hired_actors=self.auditions.filter do |t|
            t.hired == true
        # binding.pry
        end
        hired_actors.second
    end
end