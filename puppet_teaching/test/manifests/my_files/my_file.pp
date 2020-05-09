# Class: test::files::my_file
#
#
class test::my_files::my_file {
	# resources
	file { '/tmp/test.txt':
		ensure => file,
		source => 'puppet:///modules/test/f.txt',
		replace => true,
	}
}
