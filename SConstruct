#!/usr/bin/env python
import os
import sys

tests = ARGUMENTS.get('tests', 0)
if int(tests):
	env = Environment(disable_exceptions='no', build_library='no', tools=["default"], PLATFORM="")
	Export('env')
env = SConscript("godot-cpp/SConstruct")

# For reference:
# - CCFLAGS are compilation flags shared between C and C++
# - CFLAGS are for C-specific compilation flags
# - CXXFLAGS are for C++-specific compilation flags
# - CPPFLAGS are for pre-processor flags
# - CPPDEFINES are for pre-processor defines
# - LINKFLAGS are for linking flags

# tweak this if you want to use different folders, or more folders, to store your source code in.
env.Prepend(CPPPATH=["doctest/","src/","tests/"])
sources = Glob("src/*.cpp")

# If non-release build, compile the test files
if env.debug_features and int(tests):
    sources.extend(Glob("tests/*.cpp"))
    env.Append(CPPDEFINES=['TESTS_ENABLED'])

if env["platform"] == "macos":
    library = env.SharedLibrary(
        "bin/libalife.{}.{}.framework/libalife.{}.{}".format(
            env["platform"], env["target"], env["platform"], env["target"]
        ),
        source=sources,
    )
else:
    library = env.SharedLibrary(
        "bin/libalife{}{}".format(env["suffix"], env["SHLIBSUFFIX"]),
        source=sources,
    )

Default(library)
