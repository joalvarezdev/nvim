cache = true

ignore = {
  "122", -- Setting a read-only field of a global variable.
  "212", -- Unused argument, In the case of callback function 
}

read_globals = {
  "vim",
}
