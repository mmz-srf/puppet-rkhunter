module MCollective
  module Agent
    class Rkhunter<RPC::Agent

      rkhunter = '/usr/bin/rkhunter'
      cat = '/bin/cat'

      action 'propupd' do
        reply[:out] = run("#{rkhunter} --propupd; #{rkhunter} --cronjob --rwo > /var/log/rkhunter_warnings.log || true", :stdout => :out, :chomp => true)
        reply[:status] = 'OK'
      end

      action 'runcheck' do
        reply[:out] = run("#{rkhunter} --cronjob --rwo > /var/log/rkhunter_warnings.log || true", :stdout => :out, :chomp => true)
        reply[:status] = 'OK'
      end

      action 'showlastrun' do
        reply[:out] = run("#{cat} /var/log/rkhunter_warnings.log || true", :stdout => :out, :chomp => true)
        reply[:status] = 'OK'
      end

      activate_when do
        File.executable?(rkhunter)
      end

    end
  end
end
