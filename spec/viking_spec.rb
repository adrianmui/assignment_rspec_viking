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

    it 'health cannot be overwritten after it was set in initialize' do
      expect{v.health = 22}.to raise_error
    end

    it 'Viking weapon starts out as nil on default' do
      expect(v.weapon).to eq(nil)
    end
  end

  describe '#pick_up_weapon' do

    it 'picking up a Weapon sets it as the new weapon' do
      w = instance_double("Weapon", :name => "Cool Weapon")
      v.pick_up_weapon(w)
      expect(v.weapon.name).to eq("Cool Weapon")
    end
  end
end