let maparg_dict = maparg('<CR>', 'n', 0, 1)
if get(maparg_dict, 'buffer', 0)
  call colonize#rename(maparg_dict, 'g<CR>', 'n')
endif
unlet maparg_dict
