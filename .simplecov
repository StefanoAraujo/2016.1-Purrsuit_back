require 'codeclimate-test-reporter'

SimpleCov.start('rails') do
  add_filter 'app/serializers'
  add_filter 'app/mailers'
  add_filter 'app/helpers'
  add_filter 'app/models/parser.rb'
end
