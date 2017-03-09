server 'eddy.toonwillems.be', user: 'deploy', roles: %w{web app db},
  ssh_options: {
    forward_agent: true,
    auth_methods: ['publickey'],
    port: 22
  }
