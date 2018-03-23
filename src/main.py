import sysconfig
print(sysconfig.get_config_var('LDVERSION')
      or sysconfig.get_config_var('py_version_short'))
