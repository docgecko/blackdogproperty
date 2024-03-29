# A sample Guardfile
# More info at https://github.com/guard/guard#readme

group 'backend' do
  guard 'bundler' do
    watch('Gemfile')
  end

  guard 'rspec', :version => 2, :cli => '--color --format doc' do
    watch(%r{^spec/.+_spec\.rb})
    watch(%r{^lib/(.+)\.rb})     { |m| "spec/lib/#{m[1]}_spec.rb" }
    watch('spec/spec_helper.rb') { "spec" }

    # Rails example
    watch('spec/spec_helper.rb')                        { "spec" }
    watch('config/routes.rb')                           { "spec/routing" }
    watch('app/controllers/application_controller.rb')  { "spec/controllers" }
    watch(%r{^spec/.+_spec\.rb})
    watch(%r{^app/(.+)\.rb})                            { |m| "spec/#{m[1]}_spec.rb" }
    watch(%r{^lib/(.+)\.rb})                            { |m| "spec/lib/#{m[1]}_spec.rb" }
    watch(%r{^app/controllers/(.+)_(controller)\.rb})   { |m| ["spec/routing/#{m[1]}_routing_spec.rb", "spec/#{m[2]}s/#{m[1]}_#{m[2]}_spec.rb", "spec/acceptance/#{m[1]}_spec.rb"] }
  end
end

group 'frontend' do
  guard 'livereload' do
    watch(%r{app/.+\.(erb|haml)})
    watch(%r{app/helpers/.+\.rb})
    watch(%r{public/.+\.(css|js|html)})
    watch(%r{config/locales/.+\.yml})
		# Rails Assets Pipeline
	  watch(%r{(app|vendor)/assets/\w+/(.+\.(css|js|html)).*})  { |m| "/assets/#{m[2]}" }
  end
end

guard 'brakeman' do
  watch(%r{^app/.+\.(erb|haml|rhtml|rb)$})
  watch(%r{^config/.+\.rb$})
  watch(%r{^lib/.+\.rb$})
  watch('Gemfile')
end
