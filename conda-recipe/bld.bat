mkdir build_cmake
cd build_cmake

cmake ../ ^
    -G "Visual Studio 14 2015 Win64" ^
	-DCMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
	-DCMAKE_PREFIX_PATH=%LIBRARY_PREFIX% ^
	-DPROTOBUF_ROOT=../ ^
	-Dprotobuf_BUILD_TESTS=OFF ^
	-Dprotobuf_MSVC_STATIC_RUNTIME=OFF ^
	-Dprotobuf_BUILD_SHARED_LIBS=OFF ^
	-DCMAKE_DEBUG_POSTFIX=d ^
	-DCMAKE_PREFIX_PATH=$PREFIX ^
	-DSERIAL_BUILD_WIHOUT_ROS=ON ^
	-DNOVATEL_BUILD_EXAMPLES=OFF ^
	-DNOVATEL_BUILD_TESTS=OFF ^
	-DBUILD_WITH_ROS=OFF

if errorlevel 1 exit 1

cmake --build . --target INSTALL --config Debug

if errorlevel 1 exit 1

cmake --build . --target INSTALL --config Release

if errorlevel 1 exit 1
