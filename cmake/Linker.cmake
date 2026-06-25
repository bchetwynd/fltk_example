macro(fltk_example_configure_linker project_name)
  set(fltk_example_USER_LINKER_OPTION
    "DEFAULT"
      CACHE STRING "Linker to be used")
    set(fltk_example_USER_LINKER_OPTION_VALUES "DEFAULT" "SYSTEM" "LLD" "GOLD" "BFD" "MOLD" "SOLD" "APPLE_CLASSIC" "MSVC")
  set_property(CACHE fltk_example_USER_LINKER_OPTION PROPERTY STRINGS ${fltk_example_USER_LINKER_OPTION_VALUES})
  list(
    FIND
    fltk_example_USER_LINKER_OPTION_VALUES
    ${fltk_example_USER_LINKER_OPTION}
    fltk_example_USER_LINKER_OPTION_INDEX)

  if(${fltk_example_USER_LINKER_OPTION_INDEX} EQUAL -1)
    message(
      STATUS
        "Using custom linker: '${fltk_example_USER_LINKER_OPTION}', explicitly supported entries are ${fltk_example_USER_LINKER_OPTION_VALUES}")
  endif()

  set_target_properties(${project_name} PROPERTIES LINKER_TYPE "${fltk_example_USER_LINKER_OPTION}")
endmacro()
