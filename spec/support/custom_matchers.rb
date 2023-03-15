module CustomMatchers
    RSpec::Matchers.define :be_a_float do
      match do |actual|
        actual.is_a?(Float)
      end
    end

    RSpec::Matchers.define :be_a_boolean do
      match do |actual|
        [true, false].include?(actual)
      end
    end
end