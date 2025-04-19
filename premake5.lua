project "GLFW"
kind "StaticLib"
language "C"

targetdir ("bin/" .. outputdir .. "/%{prj.name}")
objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

files
{
    "include/GLFW/glfw3.h",
    "include/GLFW/glfw3native.h",
    "src/glfw_config.h",
    "src/context.c",
    "src/init.c",
    "src/input.c",
    "src/monitor.c",
    "src/vulkan.c",
    "src/window.c",
}

    filter "system:windows"
    buildoptions {"-std=c11", "lgdi32"}
    systemversion "latest"
    staticruntime "On"

    files
    {
       "stc/win32_init.c", 
       "stc/win32_joystick.c", 
       "stc/win32_monitor.c",
       "stc/win32_time.c",
       "stc/win32_thread.c",
       "stc/win32_window.c",
       "stc/wgl_context.c",
       "stc/egl_context.c",
       "stc/osmesa_context.c"
    }

    defines
    {
        "_GLFW_WIN32",
        "_CRT_SECURE_NO_WARNINGS",
    }

    filter {"system:windows", "configurations:Release"}
        buildoptions "/MT"