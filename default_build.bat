@setlocal
if "%1"=="re" (rmdir /s /q build)

@where cl >nul 2>nul || call "%VS140COMNTOOLS%vsvars32.bat"

if not defined GENERATOR (set GENERATOR=-G "NMake Makefiles") else (set JUST_GENERATE=1)

if not exist build\ (
    cmake -E make_directory build
)

pushd build

cmake .. %GENERATOR% ^
  -DCMAKE_BUILD_TYPE=Release ^
  -DLUA=D:/ML/./luajit ^
  -DLUALIB=libluajit.lib ^
  -DLUA_BINDIR="D:/ML/." ^
  -DLUA_INCDIR="D:/ML/include" ^
  -DLUA_LIBDIR="D:/ML/." ^
  -DLUADIR="D:/ML/luarocks/async/scm-1/lua" ^
  -DLIBDIR="D:/ML/luarocks/async/scm-1/lib" ^
  -DCMAKE_INSTALL_PREFIX="D:/ML/luarocks/async/scm-1"

if "%JUST_GENERATE%"=="1" (
    devenv Project.sln
    popd
    exit /b 0
)

@echo|set /p="To build now: "
@pause

nmake

@echo|set /p="To install now: "
@pause

nmake install

popd
