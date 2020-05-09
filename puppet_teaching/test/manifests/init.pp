class test {
  include test::packages::install
  include test::users::milton
  include test::users::hiera_user
  include test::my_files::my_file
}
