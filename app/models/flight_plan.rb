class FlightPlan < ApplicationRecord
  belongs_to :satellite
  has_many :steps, class_name: :FlightPlanStep, dependent: :destroy

  def name
    self[:name] || "Flight Plan #{id}"
  end
end
