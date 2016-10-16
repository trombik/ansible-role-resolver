require 'spec_helper'
require 'serverspec'

describe file('/etc/resolv.conf') do
  case host_inventory['fqdn']
  when 'fixed-ip-openbsd-60-amd64'
    its(:content) { should match /nameserver 192\.168\.1\.3\nnameserver 192\.168\.1\.1\nnameserver 192\.168\.1\.2/ }
  when 'fixed-ip-freebsd-103-amd64'
    its(:content) { should match /nameserver 192\.168\.1\.1\nnameserver 192\.168\.1\.2\nnameserver 192\.168\.1\.3/ }
  else
    its(:content) { should match /nameserver 192\.168\.1\.2\nnameserver 192\.168\.1\.3\nnameserver 192\.168\.1\.1/ }
  end
end