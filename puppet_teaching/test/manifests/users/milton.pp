class test::users::milton {

	group { 'testing':
		gid => '2000',
	}

	user { 'Milton':
	  ensure  => present,
	  comment => 'Milton Last',
	  home    => '/home/Milton',
	  shell  => '/bin/bash',
	  uid    => '1090',
	  gid    => '2000'
	}
}