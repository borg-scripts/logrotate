module.exports = ->
  @then @install, 'logrotate'

  for filename, options of @server.logrotate
    @then @template [__dirname, 'templates', 'default', 'logrotate'],
      to: "/etc/logrotate.d/#{filename}"
      sudo: true
      owner: 'root'
      group: 'root'
      mode: '0644'
      variables: paths: options
