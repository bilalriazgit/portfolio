class ProjectsRecord < ApplicationRecord
  self.abstract_class = true

  connects_to database: { writing: :projects }
end
