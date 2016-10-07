if "%1"=="re" (rmdir /s /q build)

if not exist build\ (
    cmake -E make_directory build
)

pushd build

cmake .. -G "NMake Makefiles" ^
  -DCMAKE_BUILD_TYPE=Release ^
  -DLUA=D:/ML/./luajit ^
  -DLUALIB=libluajit.lib ^
  -DLUA_BINDIR="D:/ML/." ^
  -DLUA_INCDIR="D:/ML/include" ^
  -DLUA_LIBDIR="D:/ML/." ^
  -DLUADIR="D:/ML/luarocks/async/scm-1/lua" ^
  -DLIBDIR="D:/ML/luarocks/async/scm-1/lib" ^
  -DCMAKE_INSTALL_PREFIX="D:/ML/luarocks/async/scm-1"

pause
  
nmake

popd
