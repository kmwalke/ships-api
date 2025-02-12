module HomeHelper
  # TODO: put 0,0 at center screen, not bottom left
  def screen_position(pos, zoom)
    pos.to_f / zoom * 100
  end
end
