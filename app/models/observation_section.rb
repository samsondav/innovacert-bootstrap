class ObservationSection < ActiveRecord::Base
  belongs_to :instrument, inverse_of: :observation_sections
  has_many :observation_questions, inverse_of: :observation_section, dependent: :destroy
  accepts_nested_attributes_for :observation_questions, reject_if: lambda {|oq| oq[:content].blank?}, allow_destroy: true

  # for some reason calling #each on a nested form returns values in reverse order,
  # this method is provided as a helper for views in displaying the order correctly.
  def observation_questions_ordered
    observation_questions.reverse
  end
end
