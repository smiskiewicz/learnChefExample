require_relative '../../spec_helper.rb'


describe 'webserver::default' do

  let(:chef_run) do
    runner = ChefSpec::Runner.new(platform: 'ubuntu', version: '12.04')
	runner.node.set['webserver']['package_name'] = 'apache2'
	runner.converge('webserver::default')
  end
  
  it 'installs webserver package' do
    expect(chef_run).to install_package('apache2')
  end
  
  it 'starts and enables the service' do
    expect(chef_run).to start_service('apache2')
	 expect(chef_run).to enable_service('apache2')
  end
  
  it 'creates index with proper attributes' do
    expect(chef_run).to create_template('/var/www/index.html').with(
      user:   'root',
      group:  'root',
      mode: '0644',
    )
  end
end