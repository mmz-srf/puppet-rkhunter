module MCollective
  module Agent
    class Rkhunter<RPC::Agent

      rkhunter = '/usr/bin/rkhunter'
      cat = '/bin/cat'

      action 'updatedb' do
        reply[:status] = run("#{rkhunter} --propupd; #{rkhunter} --cronjob --rwo > /var/log/rkhunter_warnings.log 2>&1 && echo OK || echo ERROR", :stdout => :out, :chomp => true)
      end

      action 'runcheck' do
        reply[:status] = run("#{rkhunter} --cronjob --rwo > /var/log/rkhunter_warnings.log 2>&1 && echo OK || echo ERROR", :stdout => :out, :chomp => true)
      end

      action 'showlastrun' do
        reply[:status] = run("#{cat} /var/log/rkhunter_warnings.log", :stdout => :out, :chomp => true)
      end

      activate_when do
        File.executable?(rkhunter)
      end

    end
  end
end