require 'spec_helper'
describe('apache', :type => :class) do
  let(:node) { 'testhost.example.com' }

  context 'when called with no parameters on redhat' do
    let(:facts) { { :osfamily => 'RedHat' } }

    it {
      should contain_package('apache').with({
        'ensure' => 'present',
        'name'  => 'httpd',
      })
      should contain_file('apache_config').with({
        'ensure' => 'file',
        'source' => "puppet:///modules/apache/#{facts[:osfamily]}.conf",
      })
      should contain_service('apache').with({
        'ensure' => 'running',
        'enable' => 'true',
        'name' => 'httpd',
      })
    }
  end
end
