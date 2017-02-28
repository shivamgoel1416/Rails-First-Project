class Setting < ApplicationRecord
  def self.site_name
    Setting.first.try(:site_name)
  end
end
