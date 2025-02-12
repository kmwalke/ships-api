module HomeHelper
  def screen_position(pos, zoom)
    pos.to_f / zoom * 100
  end
end
