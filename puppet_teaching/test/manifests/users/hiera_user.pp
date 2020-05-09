# Class: test::users::hiera_user
#
#
class test::users::hiera_user {
	$my_user = lookup(test::users::user1)
	#$my_user = lookup(test::users::hiera_user)
	user { $my_user:
	  ensure  => present,
	  #uid    => '501',
	  #gid    => '20'
	}
	
}