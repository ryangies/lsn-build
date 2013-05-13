# ------------------------------------------------------------------------------
# t[#num] - [#invert ? 'Is not defined' : 'Defined']
# Generated from [#lib] line: [#lineno]
# ------------------------------------------------------------------------------

sub t[#num] {
  $result = eval {
[#test]
  };
  $@ and die $@;
  return defined $result ? 1 : 0;
}
