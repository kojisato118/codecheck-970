class Project < ActiveRecord::Base
  validates :title, presence: true
  validates :description, presence: true

  def self.find_projects(page: 1)
    Project.page(page).per(10)
  end
end
