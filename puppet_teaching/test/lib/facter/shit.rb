Facter.add(:shit) do
  setcode do
    Facter::Core::Execution.execute('/usr/bin/hostname -y')
  end
end