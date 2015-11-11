class OutputObject
  def success(arg)
    $stdout.puts 'Success!'
    $stdout.puts arg.inspect
  end

  def failure(arg)
    $stderr.puts 'Failure!'
    $stderr.puts arg.inspect
  end
end
