class Project
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  include Mongoid::Timestamps::Updated
  field :title, type: String
  field :start_date, type: Date
  field :end_date, type: Date
  field :category, type: Integer


  embedded_in :user
 
end
