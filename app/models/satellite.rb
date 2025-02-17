class Satellite < ApplicationRecord
  has_many :flight_plans, dependent: :destroy
  belongs_to :current_course, class_name: :FlightPlan, optional: true

  # TODO
  # Update this whole class for readability.  This math will get complicated.  Methods will help
  # Add testing.  Switch to TDD after initial graphical version works

  def move(delta_t)
    follow_course

    thrust_x, thrust_y = scalar_thrust

    new_velocity_x = (thrust_x * delta_t) + velocity_x
    new_velocity_y = (thrust_y * delta_t) + velocity_y
    new_position_x = (new_velocity_x * delta_t) + position_x
    new_position_y = (new_velocity_y * delta_t) + position_y

    update(
      velocity_x: new_velocity_x,
      velocity_y: new_velocity_y,
      position_x: new_position_x,
      position_y: new_position_y
    )
  end

  def on_course?
    !current_course.nil?
  end

  def follow_course
    # TODO
    # will need to backdate a flip & burn, if it was supposed to happen between newton iterations
    # refactor for readability
    return unless on_course?

    current_course.update(current_step: current_course.current_step + 1) if Time.zone.now > current_step.end_time

    if current_course.current_step > current_course.steps.count
      current_course.update(current_step: nil)
      update(current_course: nil)
      update(thrust: 0)
    elsif orientation != current_step.orientation || thrust != current_step.thrust
      update(
        orientation: current_step.orientation,
        thrust: current_step.thrust
      )
    end
  end

  def current_step
    current_course.steps[current_course.current_step - 1]
  end

  def plot_course(satellite, gees)
    return if satellite == self

    gees * Newton::G # thrust

    # TODO
    # Create a flight computer class to hold this logic
    # Calculating flight plan takes time.  Better flight computers can do it faster
    # start by going to full stop, velocity = 0.  In case you calculate, but don't engage for a while
    # find orientation to destination
    # find distance to destination
    # https://space.stackexchange.com/questions/840/how-fast-will-1g-get-you-there
    # distance(m) = (1/2) acceleration(m/s/s) * time(s) ^2
    # Use this equation: divide distance in half, solve for time, that is time until flip
    # Should be saved in a 'flight plan' object: Burn at x orientation for y time, flip, then x` orientation for y time
    # For now, flip is instant, so y time is exactly half
    # find half distance, y time is time to halfway point
    # in the future, include gravity, mass of ship, momentum, inertia, etc...
    # This is just 2 steps, but a flight plan should be able to be many steps
    # delete flight plan on arrival unless plan.save_plan?
    # should come to full stop on arrival.  velocity = 0.  In the future, this will be like docking/orbiting
    # This does not execute the course, just plans it.  All times in seconds, not real time, like 7pm or whatever
    #   So burn for 300 seconds, but no concept of what time that is in Time.now terms
  end

  def engage(course)
    return if course.nil?

    start_time = Time.zone.now

    step_end_time = start_time

    course.steps.each do |step|
      step_end_time += step.duration
      step.update(end_time: step_end_time)
    end

    course.update(current_step: 1)

    update(current_course: course)

    follow_course
  end

  private

  def radians(degrees)
    Math::PI / 180 * degrees
  end

  def scalar_thrust
    [
      Math.cos(radians(orientation)) * thrust,
      Math.sin(radians(orientation)) * thrust
    ]
  end
end
