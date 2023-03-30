control 'nginx' do
    impact 6.5
    title 'Check if Redis Server is using the default port 80'
    desc 'The nginx  server must be configured such that it does not run on the default port 80. '
    describe file('/etc/nginx/nginx.conf') do
        its('content') { should_not match(%r{^port\ 80}) }
        its('content') { should_not match(%r{^port\ 0}) }
        end
    describe port(80) do
    it { should_not be_listening }
    end
end
