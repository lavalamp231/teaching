node 'default' {
}

node 'puppet-server.exercise.com' {
    class { 'puppetdb::master::config':
      puppetdb_server => 'puppetdb-server.esxi.com',
      puppetdb_port   => 8081,
        }

}

node 'puppetdb-server.exercise.com' {

        class { 'puppetdb':
        listen_address => '0.0.0.0',
        open_listen_port => true,
        manage_firewall => false,
        certificate_whitelist => [ $::servername ],
        }
    }

}