# Require /lib and /models
Dir[File.join(File.dirname(__FILE__), 'lib', '**', '*.rb')].each { |file| require file }

# This feels wrong
class String
  def is_number?
    true if Float(self) rescue false
  end
end