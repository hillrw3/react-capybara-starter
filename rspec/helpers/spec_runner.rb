require 'httparty'
require_relative './navigation'

class SpecRunner
  extend Navigation

  def self.start
    pid = Process.spawn("cd .. && webpack-dev-server --port=#{ui_port}")
    started = false

    10.times do
      begin
        response = HTTParty.get("http://localhost:#{ui_port}")

        if response.success?
          started = true
          break
        end
      rescue Errno::ECONNREFUSED
        sleep 1
      end
    end

    unless started
      raise 'React failed to start'
    end
  end

  def self.stop
    ui_pid = `lsof -i:#{ui_port} -t`
    `kill #{ui_pid}` if ui_pid.length > 1
  end
end