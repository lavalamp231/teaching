# Class: test
#
#
class test::packages::install {
	package { 'htop':
		ensure => installed,
	}
}
