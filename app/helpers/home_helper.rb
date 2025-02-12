module HomeHelper
  def screen_position(pos, zoom)
    pos.to_f / zoom.to_f * 100
  end
end
