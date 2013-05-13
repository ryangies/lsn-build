# ------------------------------------------------------------------------------
# t[#num] - [#invert ? 'Does not match' : 'Match']
# Generated from [#lib] line: [#lineno]
# ------------------------------------------------------------------------------

sub t[#num] {
  $result = eval {
[#test]
  };
  $@ and die $@;
  return unless defined $result;
  return $result eq '[#result]';
}
