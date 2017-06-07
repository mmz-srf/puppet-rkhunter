metadata    :name        => "rkhunter",
            :description => "rkhunter tasks",
            :author      => "Gianni Carafa",
            :license     => "Apache License",
            :version     => "2.0",
            :url         => "none",
            :timeout     => 300

action "propupd", :description => "Update rkhunter Database" do
    display :always

    output :out,
          :description => "Update rkhunter Database",
          :display_as  => "rkhunter --propupd"
end

action "runcheck", :description => "Run rkhunter check" do
    display :always

    output :out,
          :description => "Run rkhunter check",
          :display_as  => "rkhunter  --cronjob --rwo"
end

action "showlastrun", :description => "Show last rkhunter run" do
    display :always

    output :out,
          :description => "Show last rkhunter run",
          :display_as  => "cat /var/log/rkhunter_warnings.log"
end

