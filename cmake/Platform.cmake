
#cmake has some strange defaults, this should help us a lot
#Please use them everywhere

#WINDOWS = Windows Desktop
#WINRT   = Windows RT
#WP8     = Windows Phone 8
#ANDROID = Android
#IOS     = iOS
#MACOSX  = MacOS X
#LINUX   = Linux

if (${CMAKE_SYSTEM_NAME} MATCHES "Windows")
    if(WINRT)
        set(SYSTEM_STRING "Windows RT")
    elseif(WP8)
        set(SYSTEM_STRING "Windows Phone 8")
    else()
        set(WINDOWS TRUE)
        set(SYSTEM_STRING "Windows Desktop")
    endif()
elseif (${CMAKE_SYSTEM_NAME} MATCHES "Linux")
    if(ANDROID)
        set(SYSTEM_STRING "Android")
    else()
        set(LINUX TRUE)
        set(SYSTEM_STRING "Linux")
    endif()
elseif (${CMAKE_SYSTEM_NAME} MATCHES "Darwin")
    if(IOS)
        set(SYSTEM_STRING "IOS")
    else()
        set(MACOSX TRUE)
        set(SYSTEM_STRING "Mac OSX")
    endif()
endif()

if ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "Clang")
    set(COMPILER_STRING ${CMAKE_CXX_COMPILER_ID})
    set(CLANG TRUE)
elseif ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "GNU")
    if(MINGW)
        set(COMPILER_STRING "Mingw GCC")
    else()
        set(COMPILER_STRING "GCC")
    endif()
    set(GCC TRUE)
elseif ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "Intel")
    set(COMPILER_STRING "${CMAKE_CXX_COMPILER_ID} C++")
    set(ICC TRUE)
elseif ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "MSVC")
    set(COMPILER_STRING "Visual Studio C++")
endif()

if(CMAKE_CROSSCOMPILING)
    set(BUILDING_STRING "It appears you are cross compiling for ${SYSTEM_STRING} with ${COMPILER_STRING}")
else()
    set(BUILDING_STRING "It appears you are builing natively for ${SYSTEM_STRING} with ${COMPILER_STRING}")
endif()
