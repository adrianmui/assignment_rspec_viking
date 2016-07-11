require_relative "../lib/viking.rb"
require 'spec_helper'

describe Viking do
  let (:v) { Viking.new("Mike", 69)}

  describe '#initialize' do
    it 'passing a name to a new viking sets name' do
      expect(v.name).to eq("Mike")
    end

    it 'passing a health attribute to a new Viking sets health' do
      expect(v.health).to eq(69)
    end




  end
end