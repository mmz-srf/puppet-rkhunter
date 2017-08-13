require 'spec_helper'


describe 'rkhunter::cron', :type => :class do
  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:facts){facts}

      it do
        should contain_cron('rkhunter-cron').with(
          'user'  => 'root',
        )
      end
    end
  end
end
