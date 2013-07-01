# vim FTW
# Pry.config.editor = "mvim"

# Sublime Text 2 pwns FTW
Pry.config.editor = proc { |file, line| "/usr/local/bin/subl -w #{file}:#{line}" }

# Prompt with ruby version
# Pry.prompt = [proc { |obj, nest_level| "#{RUBY_VERSION} (#{obj}):#{nest_level} > " }, proc { |obj, nest_level| "#{RUBY_VERSION} (#{obj}):#{nest_level} * " }]

if defined?(Rails) && Rails.env
  begin
    extend Rails::ConsoleMethods if defined?(Rails::ConsoleMethods)
    require "rails/console/app"
    require "rails/console/helpers"
  rescue LoadError => e
    require "console_app"
    require "console_with_helpers"
  end
end

begin
  require "awesome_print"
  Pry.config.print = proc { |output, value| Pry::Helpers::BaseHelpers.stagger_output("=> #{value.ai}", output) }
rescue LoadError => err
  warn "=> Unable to load awesome_print"
end

begin
  require "hirb"
  Hirb.enable
  lambda do
    _pry_print = Pry.config.print
    Pry.config.print = proc { |output, value| Hirb::View.view_or_page_output(value) || _pry_print.call(output, value) }
  end.call
rescue LoadError
  warn "=> Unable to load hirb"
end
