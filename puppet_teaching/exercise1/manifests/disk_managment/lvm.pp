class exercise1::disk_managment::lvm {

	require exercise1::disk_managment::disk
	require exercise1::users::users

	# $physical_volumes = ['/dev/sdb1', '/dev/sdc1']

	# physical_volume {$physical_volumes => present}


	physical_volume { '/dev/sdb1':
	  ensure => present,
	}

	physical_volume { '/dev/sdc1':
	  ensure => present,
	}

	volume_group { 'exercisevg':
	  ensure           => present,
	  physical_volumes => ['/dev/sdb1', '/dev/sdc1'],
	}

	logical_volume { 'exercise.fs':
	  ensure       => present,
	  volume_group => 'exercisevg',
	  size         => '12G',
	}

	filesystem { '/dev/exercisevg/exercise.fs':
	  ensure  => present,
	  fs_type => 'xfs',
	}

	file { '/exercise':
		ensure => directory,
		owner => 'Andrew',
		group => 'Andrews_Group'
	}
}