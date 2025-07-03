class ProjectUser < ApplicationRecord
  belongs_to :project_id
  belongs_to :user_id
end
