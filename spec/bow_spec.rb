require_relative "../lib/weapons/bow.rb"
require 'spec_helper'

describe Bow do

  let(:b){Bow.new}

  it 'should read the bow count' do
    expect(b.arrows).to_not raise
  end

end