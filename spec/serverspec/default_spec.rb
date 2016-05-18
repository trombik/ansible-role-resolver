require 'spec_helper'
require 'serverspec'

describe file('/etc/resolvconf.conf') do
  its(:content) { should match /name_servers="192\.168\.1\.2 192\.168\.1\.3 192\.168\.1\.1"/ }
end

describe file('/etc/resolv.conf') do
  its(:content) { should match /nameserver 192\.168\.1\.2\nnameserver 192\.168\.1\.3\nnameserver 192\.168\.1\.1/ }
end
