package = "LocalRockInit"
version = "scm-1"
source = {
   url = "git+https://github.com/yfrit/LocalRockInit.git"
}
description = {
   homepage = "https://github.com/yfrit/LocalRockInit",
   license = "MIT <http://opensource.org/licenses/MIT>"
}
dependencies = {
   "lua ~> 5.1",
   "luafilesystem ~> 1.7.0-2"
}
build = {
   type = "builtin",
   modules = {
      LocalRockInit = "LocalRockInit.lua"
   }
}
