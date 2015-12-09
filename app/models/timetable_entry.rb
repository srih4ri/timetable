class TimetableEntry < ActiveRecord::Base
  belongs_to :classroom
  belongs_to :period
  belongs_to :subject
end
