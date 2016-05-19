require 'spec_helper'
require 'serverspec'

describe file('/etc/resolv.conf') do
  its(:content) { should match /nameserver 192\.168\.1\.1\nnameserver 192\.168\.1\.2\nnameserver 192\.168\.1\.3/ }
end
