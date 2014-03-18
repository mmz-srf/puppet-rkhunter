require 'spec_helper'

describe 'rkhunter::packages', :type => :class do
  context "On a Debian OS" do
    let :facts do
      {
        :osfamily               => 'Debian',
        :operatingsystemrelease => '7',
        :concat_basedir         => '/tmp',
      }
    end

    it do
      should contain_package('rkhunter').with(
        'ensure'  => 'installed',
      )
    end

  end
end