class exercise1::users::users {
	
	group { 'Andrews_Group':
		gid => '1020',
	}

	->

	user { 'Andrew':
	  ensure  => present,
	  #comment => 'First Last',
	  home    => '/home/Andrew',
	  #shell  => '/bin/bash',
	  uid    => '1009',
	  gid    => '1020'
	}

	user { 'Milton':
	  ensure  => present,
	  #comment => 'First Last',
	  home    => '/home/Milton',
	  #shell  => '/bin/bash',
	  uid    => '1010',
	  gid    => '1020',
	}

}