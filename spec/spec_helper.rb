# This file was generated by the `rspec --init` command. Conventionally, all
# specs live under a `spec` directory, which RSpec adds to the `$LOAD_PATH`.
# The generated `.rspec` file contains `--require spec_helper` which will cause
# this file to always be loaded, without a need to explicitly require it in any
# files.
#
# Given that it is always loaded, you are encouraged to keep this file as
# light-weight as possible. Requiring heavyweight dependencies from this file
# will add to the boot time of your test suite on EVERY test run, even for an
# individual file that may not need all of that loaded. Instead, consider making
# a separate helper file that requires the additional dependencies and performs
# the additional setup, and require it from the spec files that actually need
# it.
#
# See http://rubydoc.info/gems/rspec-core/RSpec/Core/Configuration
require 'webmock/rspec'
WebMock.disable_net_connect!(allow_localhost: true)

require 'simplecov'
SimpleCov.start

require 'contentstack'

RSpec.configure do |config|
  # rspec-expectations config goes here. You can use an alternate
  # assertion/expectation library such as wrong or the stdlib/minitest
  # assertions if you prefer.
  config.expect_with :rspec do |expectations|
    # This option will default to `true` in RSpec 4. It makes the `description`
    # and `failure_message` of custom matchers include text for helper methods
    # defined using `chain`, e.g.:
    #     be_bigger_than(2).and_smaller_than(4).description
    #     # => "be bigger than 2 and smaller than 4"
    # ...rather than:
    #     # => "be bigger than 2"
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  # rspec-mocks config goes here. You can use an alternate test double
  # library (such as bogus or mocha) by changing the `mock_with` option here.
  config.mock_with :rspec do |mocks|
    # Prevents you from mocking or stubbing a method that does not exist on
    # a real object. This is generally recommended, and will default to
    # `true` in RSpec 4.
    mocks.verify_partial_doubles = true
  end

  # This option will default to `:apply_to_host_groups` in RSpec 4 (and will
  # have no way to turn it off -- the option exists only for backwards
  # compatibility in RSpec 3). It causes shared context metadata to be
  # inherited by the metadata hash of host groups and examples, rather than
  # triggering implicit auto-inclusion in groups with matching metadata.
  config.shared_context_metadata_behavior = :apply_to_host_groups

# The settings below are suggested to provide a good initial experience
# with RSpec, but feel free to customize to your heart's content.
=begin
  # This allows you to limit a spec run to individual examples or groups
  # you care about by tagging them with `:focus` metadata. When nothing
  # is tagged with `:focus`, all examples get run. RSpec also provides
  # aliases for `it`, `describe`, and `context` that include `:focus`
  # metadata: `fit`, `fdescribe` and `fcontext`, respectively.
  config.filter_run_when_matching :focus

  # Allows RSpec to persist some state between runs in order to support
  # the `--only-failures` and `--next-failure` CLI options. We recommend
  # you configure your source control system to ignore this file.
  config.example_status_persistence_file_path = "spec/examples.txt"

  # Limits the available syntax to the non-monkey patched syntax that is
  # recommended. For more details, see:
  #   - http://rspec.info/blog/2012/06/rspecs-new-expectation-syntax/
  #   - http://www.teaisaweso.me/blog/2013/05/27/rspecs-new-message-expectation-syntax/
  #   - http://rspec.info/blog/2014/05/notable-changes-in-rspec-3/#zero-monkey-patching-mode
  config.disable_monkey_patching!

  # This setting enables warnings. It's recommended, but in some cases may
  # be too noisy due to issues in dependencies.
  config.warnings = true

  # Many RSpec users commonly either run the entire suite or an individual
  # file, and it's useful to allow more verbose output when running an
  # individual spec file.
  if config.files_to_run.one?
    # Use the documentation formatter for detailed output,
    # unless a formatter has already been configured
    # (e.g. via a command-line flag).
    config.default_formatter = "doc"
  end

  # Print the 10 slowest examples and example groups at the
  # end of the spec run, to help surface which specs are running
  # particularly slow.
  config.profile_examples = 10

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = :random

  # Seed global randomization in this process using the `--seed` CLI option.
  # Setting this allows you to use `--seed` to deterministically reproduce
  # test failures related to randomization by passing the same `--seed` value
  # as the one that triggered the failure.
  Kernel.srand config.seed
=end

  config.before(:each) do
    stub_request(:get, /custom-cdn.contentstack.com\/v3\/content_types/).
      with(headers: {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
      to_return(:status => 200, :body => File.read(File.dirname(__FILE__) + '/fixtures/content_types.json'), :headers => {})

    stub_request(:get, /eu-cdn.contentstack.com\/v3\/content_types/).
      with(headers: {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
      to_return(:status => 200, :body => File.read(File.dirname(__FILE__) + '/fixtures/content_types.json'), :headers => {})

    stub_request(:get, /cdn.contentstack.io\/v3\/content_types/).
      with(headers: {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
      to_return(:status => 200, :body => File.read(File.dirname(__FILE__) + '/fixtures/content_types.json'), :headers => {})
    
    stub_request(:get, /cdn.contentstack.io\/v3\/content_types\/category/).
      with(headers: {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
      to_return(:status => 200, :body => File.read(File.dirname(__FILE__) + '/fixtures/category_content_type.json'), :headers => {})
    
    stub_request(:get, /cdn.contentstack.io\/v3\/assets/).
      with(headers: {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
      to_return(:status => 200, :body => File.read(File.dirname(__FILE__) + '/fixtures/asset_collection.json'), :headers => {})

    stub_request(:get, /cdn.contentstack.io\/v3\/assets\/image_1/).
      with(headers: {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
      to_return(:status => 200, :body => File.read(File.dirname(__FILE__) + '/fixtures/asset.json'), :headers => {})

    stub_request(:get, /cdn.contentstack.io\/v3\/content_types\/product\/entries/).
      with(headers: {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
      to_return(:status => 200, :body => File.read(File.dirname(__FILE__) + '/fixtures/product_entry_collection.json'), :headers => {})

    stub_request(:get, /cdn.contentstack.io\/v3\/content_types\/product\/entries\/uid/).
      with(headers: {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
      to_return(:status => 200, :body => File.read(File.dirname(__FILE__) + '/fixtures/product_entry.json'), :headers => {})

    stub_request(:get, /cdn.contentstack.io\/v3\/content_types\/category\/entries/).
      with(headers: {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
      to_return(:status => 200, :body => File.read(File.dirname(__FILE__) + '/fixtures/category_entry_collection_without_count.json'), :headers => {})

    stub_request(:get, /cdn.contentstack.io\/v3\/content_types\/category\/entries.*include_count=true/).
      with(headers: {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
      to_return(:status => 200, :body => File.read(File.dirname(__FILE__) + '/fixtures/category_entry_collection.json'), :headers => {})

    stub_request(:get, /cdn.contentstack.io\/v3\/content_types\/category\/entries\/uid/).
      with(headers: {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
      to_return(:status => 200, :body => File.read(File.dirname(__FILE__) + '/fixtures/category_entry.json'), :headers => {})

    stub_request(:get, /cdn.contentstack.io\/v3\/stacks\/sync/).
      with(headers: {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
      to_return(:status => 200, :body => File.read(File.dirname(__FILE__) + '/fixtures/sync_init.json'), :headers => {})

    stub_request(:get, /preview.contentstack.io\/v3\/content_types\/category\/entries/).
      with(headers: {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
      to_return(:status => 200, :body => File.read(File.dirname(__FILE__) + '/fixtures/category_entry_collection_without_count.json'), :headers => {})

    stub_request(:get, /preview.contentstack.io\/v3\/content_types\/category\/entries\/uid/).
      with(headers: {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
      to_return(:status => 200, :body => File.read(File.dirname(__FILE__) + '/fixtures/category_entry.json'), :headers => {})

  end

  def create_client(delivery_token = ENV['DELIVERY_TOKEN'], api_key = ENV['API_KEY'], environment = ENV['ENVIRONMENT'], options = {})
    Contentstack::Client.new(api_key, delivery_token, environment, options)
  end

  def create_preview_client(delivery_token = ENV['DELIVERY_TOKEN'], api_key = ENV['API_KEY'], environment = ENV['ENVIRONMENT'], options = {live_preview: {host: 'https://preview.contentstack.io', enable: true, management_token: 'auth'}})
    Contentstack::Client.new(api_key, delivery_token, environment, options)
  end

  def render(content, entry)
    Contentstack::render_content(content, ContentstackUtils::Model::Options.new(entry))
  end
  def json_to_html(content, entry)
    Contentstack::json_to_html(content, ContentstackUtils::Model::Options.new(entry))
  end
end