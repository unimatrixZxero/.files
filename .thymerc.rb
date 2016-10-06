#!/usr/bin/env ruby
set :timer, 60 * 25 # minute pomodoros
set :timer_break, 60 * 5 # 5 minute timer
set :interval, 1 # second timer refresh

option(:o, :one, 'You have one minute') do
  set :timer, 60 * 1
  @run = true
end


before { `terminal-notifier -message "Let's get started!"` }
after { |s|
  if s == 0
    `terminal-notifier -message "Time's up"`
    `mpg123 /Users/safi/Dropbox/sounds/campfire_horn.mp3`
  end
}
