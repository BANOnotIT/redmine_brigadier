require_dependency 'time_entry'

module RedmineBrigadier
  module TimeEntryPatch
    def validate_time_entry
      super

      if self.issue && self.spent_on
        issue = self.issue

        if issue.due_date && issue.due_date < self.spent_on
          errors.add :spent_on, :less_than_or_equal_to, count: issue.due_date
        end
        if issue.start_date && issue.start_date > self.spent_on
          errors.add :spent_on, :greater_than_or_equal_to, count: issue.start_date
        end

        min_date = Date.today - 1.day
        if min_date > self.spent_on
          errors.add :spent_on, :greater_than_or_equal_to, count: min_date
        end

      end
    end
  end
end

TimeEntry.send(:prepend, RedmineBrigadier::TimeEntryPatch)