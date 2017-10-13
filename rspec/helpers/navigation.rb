module Navigation
  UI_PORT=8081

  def root_path
    "localhost:#{ui_port}"
  end

  def ui_port
    UI_PORT
  end
end