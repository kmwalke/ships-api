Satellite.destroy_all

MOON_X = 332_899_299
MOON_Y = 192_199_500

Satellite.create(
  [
    {
      name: 'Earth'
    },
    {
      name: 'Moon',
      position_x: MOON_X,
      position_y: MOON_Y
    },
    {
      name: 'L-1',
      position_x: MOON_X * 0.8,
      position_y: MOON_Y * 0.8
    },
    {
      name: 'L-2',
      position_x: MOON_X * 1.2,
      position_y: MOON_Y * 1.2
    },
    {
      name: 'L-3',
      position_x: MOON_X * -1,
      position_y: MOON_Y * -1
    },
    {
      name: 'L-4',
      position_x: 0,
      position_y: 0
    },
    {
      name: 'L-5',
      position_x: 0,
      position_y: 0
    }
  ]
)

roci = Satellite.create(
  name: 'Rocinante'
)

fp = FlightPlan.create(
  satellite: roci,
  name: 'Earth - Moon'
)

FlightPlanStep.create(
  [
    {
      flight_plan: fp,
      orientation: 30,
      time: 1.75 * 60 * 60
    },
    {
      flight_plan: fp,
      orientation: 210,
      time: 1.75 * 60 * 60
    }
  ]
)

fp = FlightPlan.create(
  satellite: roci
)

FlightPlanStep.create(
  [
    {
      flight_plan: fp,
      orientation: 0,
      time: 60
    },
    {
      flight_plan: fp,
      orientation: 90,
      time: 60
    },
    {
      flight_plan: fp,
      orientation: 225,
      time: 60
    }
  ]
)
