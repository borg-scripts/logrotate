module.exports = ->
  @then @install, 'logrotate'

  @then (cb) =>
    @each @server.logrotate, cb, ([filename, options], next) =>
      @template [__dirname, 'templates', 'default', 'logrotate'],
        to: "/etc/logrotate.d/#{filename}"
        sudo: true
        owner: 'root'
        group: 'root'
        mode: '0644'
        variables: paths: options
        next
