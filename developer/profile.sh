# Environment
  export LSN_SRC_ROOT='/usr/local/src/lsn'
  export PERLLIB="${LSN_SRC_ROOT}/lsn-data-hub/src/lib:${PERLLIB}"
  export PERLLIB="${LSN_SRC_ROOT}/lsn-www-hub/src/lib:${PERLLIB}"

# The path
  export PATH="${LSN_SRC_ROOT}/lsn-build/bin:${PATH}"
  export PATH="${LSN_SRC_ROOT}/lsn-data-hub/src/bin:${PATH}"
  export PATH="${LSN_SRC_ROOT}/lsn-www-hub/src/bin:${PATH}"
  export PATH="${LSN_SRC_ROOT}/lsn-javascript/src/bin:${PATH}"

# Frequent places
  export lsn="${LSN_SRC_ROOT}"
  export lshub="${LSN_SRC_ROOT}/lsn-data-hub/src/lib"
  export lswww="${LSN_SRC_ROOT}/lsn-www-hub/src/lib"
  export lsres="${LSN_SRC_ROOT}/lsn-www-hub/src/share/web/res"
  export lstest="${LSN_SRC_ROOT}/code/src/test/perl"
  export lsconf="${LSN_SRC_ROOT}/lsn-www-hub/src/share/server"
  export lsext="${LSN_SRC_ROOT}/lsn-lime/src/share/web/ext"
  export lsjs="${LSN_SRC_ROOT}/lsn-javascript/src/lib/ecma"
