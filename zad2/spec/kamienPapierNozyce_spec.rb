
require_relative '../kamienPapierNozyce'

# TODO (refactor): modify $LOAD_PATH
# $LOAD_PATH << File.expand_path('../../lib', __FILE__)
# require 'part1'

# https://www.relishapp.com/rspec/rspec-expectations/v/3-0/docs/built-in-matchers

describe "#name_to_number" do
  it "should return number" do

elements = {'zero'=> 0, 'one'=> 1, 'two' => 2}

    expect(name_to_number('two',elements)).to eq(2)
  end
end

