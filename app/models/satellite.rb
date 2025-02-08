class Satellite < ApplicationRecord
  def move(delta_t)
    # check if currently engaged on a course
    # if so, may need to flip
    # Update for readability.  This math will get complicated.  Methods will help
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

  def plot_course(satellite, _gees)
    nil if satellite == self

    # find orientation to destination
    # find distance to destination
    # Should be saved in an object: Burn at x orientation for y time, flip, then x` orientation for y time
    # For now, flip is instant, so y time is exactly half
    # find half distance, y time is time to halfway point
    # This does not execute the course, just plans it.  All times in seconds, not real time, like 7pm or whatever
    #   So burn for 300 seconds, but no concept of what time that is in Time.now terms
  end

  def engage(course)
    nil if course.nil?

    # execute a given course
    # remember a start time, convert all times from course to real times
    # will need to backdate a flip & burn, if it was supposed to happen between newton iterations
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
