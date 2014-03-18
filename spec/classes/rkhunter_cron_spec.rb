require 'spec_helper'

describe 'rkhunter::cron', :type => :class do
  context "On a Debian OS" do
    let :facts do
      {
        :osfamily               => 'Debian',
        :operatingsystemrelease => '7',
        :concat_basedir         => '/tmp',
      }
    end

    it do
      should contain_cron('rkhunter-cron').with(
        'user'  => 'root',
      )
    end

  end
end