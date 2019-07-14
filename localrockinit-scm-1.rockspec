package = "LocalRockInit"
version = "scm-1"
source = {
   url = "git+https://github.com/yfrit/LocalRockInit.git"
}
description = {
   homepage = "https://github.com/yfrit/LocalRockInit",
   license = "*** please specify a license ***"
}
dependencies = {
   "lua ~> 5.1"
}
build = {
   type = "builtin",
   modules = {
      LocalRockInit = "LocalRockInit.lua"
   }
}
