require_relative "../lib/viking.rb"
require 'spec_helper'

describe Viking do
  let (:v) {Viking.new("Mike", 69)}
  let (:w) {Weapon.new("Bomb Ass")}

  describe '#initialize' do
    it 'passing a name to a new viking sets name' do
      expect(v.name).to eq("Mike")
    end

    it 'passing a health attribute to a new Viking sets health' do
      expect(v.health).to eq(69)
    end

    it 'health cannot be overwritten after it was set in initialize' do

      expect{v.health=22}.to raise_error(NoMethodError)
    end

    it 'Viking weapon starts out as nil on default' do
      expect(v.weapon).to eq(nil)
    end
  end

  describe '#pick_up_weapon' do

    it 'picking up a Weapon sets it as the new weapon' do
      v.pick_up_weapon(w)
      expect(v.weapon.name).to eq("Bomb Ass")
    end

    it 'picking up Non Weapon raises exception' do
      double_w = double('Weapon', :name => "Not Bomb Ass")
      
      expect{v.pick_up_weapon(double_w)}.to raise_error("Can't pick up that thing")
    end

    it 'Picking up a new weapon replaces the existing weapon' do
      second_wep = instance_double("Weapon", :name => "Stupid Weapon", :is_a? => Weapon)
      v.pick_up_weapon(second_wep)
      expect(v.weapon).to eql(second_wep)
    end
  end

  describe '#drop_weapon'
    it 'dropping a weapon leaves it weaponless' do
      
    end
  end

  end
end