module ServicesHelper
  require 'timeout'
  require 'socket'

  def ping(host, port)
    begin
      Timeout.timeout(5) do
        s = TCPSocket.new(host, port)
        s.close
        return true
      end
    rescue Errno::ECONNREFUSED
      return true
    rescue Timeout::Error, Errno::ENETUNREACH, Errno::EHOSTUNREACH
      return false
    end
  end

end
