ThinkingSphinx::Index.define :user, :with => :active_record do
  indexes name
  indexes email
  indexes description, :as => :profile
  indexes city, :sortable => true
  indexes year_of_birth, :facet => true
  indexes country.name
  indexes children(:name), :as => :child_name

  has status
  has finance_id, :as => :tax_id
  has created_at, :facet => true
  has country(:id), :as => :country_id
  has city.zip
end
