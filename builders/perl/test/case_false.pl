# ------------------------------------------------------------------------------
# t[#num] - [#invert ? 'Not false' : 'False']
# Generated from [#lib] line: [#lineno]
# ------------------------------------------------------------------------------

sub t[#num] {
  $result = eval {
[#test]
  };
  $@ and die $@;
  return $result ? 0 : 1;
}
