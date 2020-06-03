Facter.add(:puppet_role) do
  setcode do
    Facter::Core::Execution.execute("/usr/bin/grep -i puppet_role= /etc/puppet_role.txt | /usr/bin/sed 's/Puppet_Role=//'")
  end
end
