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

  describe '#drop_weapon' do
    it 'dropping a weapon leaves it weaponless' do
      v.drop_weapon
      expect(v.weapon).to eq(nil)
    end
  end

  describe '#receive_attack' do
    it 'reduces Viking health by specified amount' do
      allow(v).to receive(:puts)
      v.receive_attack(10)
      expect(v.health).to eq(59)
    end

    it 'calls the take_damage method' do
      expect(v).to receive(:take_damage).with(10)
      v.receive_attack(10)
    end
  end

  describe '#attack' do
    let (:z){Viking.new("Adrian", 69)}
    before do
      allow(v).to receive(:puts)
      allow(z).to receive(:puts)
    end

    it 'causes the recipient health to drop' do
      allow(v).to receive(:damage_dealt).and_return(10)
      v.attack(z)
      expect(z.health).to eq(59)
    end

    it 'calls that Viking take_damage method' do
      expect(z).to receive(:take_damage)
      v.attack(z)
    end

  end

end