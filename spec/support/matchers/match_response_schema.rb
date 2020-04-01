RSpec::Matchers.define :match_response_schema do |schema|
  match do |response|
    path = Rails.root.join('spec', 'support', 'schemas', 'api', 'v1', "#{schema}.json").to_s
    JSON::Validator.validate!(path, response.body, strict: true)
  end
end