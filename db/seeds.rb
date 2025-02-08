Satellite.destroy_all

Satellite.create(
  name: 'Earth'
)
Satellite.create(
  name: 'Moon',
  position_x: 332_899_299,
  position_y: 192_199_500
)
roci = Satellite.create(
  name: 'Rocinante'
)

fp = FlightPlan.create(
  satellite: roci,
  name: 'Earth - Moon'
)

FlightPlanStep.create(
  flight_plan: fp,
  orientation: 30,
  time: 1.75 * 60 * 60
)

FlightPlanStep.create(
  flight_plan: fp,
  orientation: 210,
  time: 1.75 * 60 * 60
)

fp = FlightPlan.create(
  satellite: roci
)

FlightPlanStep.create(
  flight_plan: fp,
  orientation: 0,
  time: 60
)

FlightPlanStep.create(
  flight_plan: fp,
  orientation: 90,
  time: 60
)

FlightPlanStep.create(
  flight_plan: fp,
  orientation: 225,
  time: 60
)
