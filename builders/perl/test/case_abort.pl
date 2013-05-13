# ------------------------------------------------------------------------------
# t[#num] - [#invert ? 'Does not abort' : 'Abort']
# Generated from [#lib] line: [#lineno]
# ------------------------------------------------------------------------------

sub t[#num] {
  no warnings 'closure';  # allows one test case to setup subroutines for 
                          # subsequent tests.
  $result = eval {
[#test]
  };
  $@ and do { $result = $@; chomp $result };
  return $@ ? 1 : 0;
}
