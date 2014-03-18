require 'spec_helper'

describe 'rkhunter', :type => :class do
  context "On a Debian OS" do
    let :facts do
      {
        :osfamily               => 'Debian',
        :operatingsystemrelease => '7',
        :concat_basedir         => '/tmp',
      }
    end

    it do
      should contain_class('rkhunter::packages')
    end


    it do
      should contain_file("/etc/rkhunter.conf").with(
        'owner'   => 'root',
        'group'   => 'root',
        'mode'    => '0644',
      )
    end

  end
end