#
# This file is part of Moo-Lax
#
# This software is Copyright (c) 2014 by Damien Krotkine.
#
# This is free software, licensed under:
#
#   The Artistic License 2.0 (GPL Compatible)
#
package oo::Lax;
{
  $oo::Lax::VERSION = '0.11';
}
 
#ABSTRACT: By default oo turns all warnings to fatal warnings. C<oo::Lax> is exactly the same as C<oo>, except that it doesn't turn all warnings to fatal warnings in the calling module.

use strictures 1;
use Moo::_Utils;
 
sub moo {
  print <<'EOMOO';
 _________________
< Moo, but relax! >
 -----------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||
EOMOO
  exit 0;
}
 
BEGIN {
    my $package;
    sub import {
        moo() if $0 eq '-';
        $package = $_[1] || 'Class';
        if ($package =~ /^\+/) {
            $package =~ s/^\+//;
            _load_module($package);
        }
    }
    use Filter::Simple sub { s/^/package $package;\nuse Moo::Lax;\n/; }
}
 
1;

__END__

=pod

=encoding UTF-8

=head1 NAME

oo::Lax - By default oo turns all warnings to fatal warnings. C<oo::Lax> is exactly the same as C<oo>, except that it doesn't turn all warnings to fatal warnings in the calling module.

=head1 VERSION

version 0.11

=head1 AUTHOR

Damien Krotkine <dams@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is Copyright (c) 2014 by Damien Krotkine.

This is free software, licensed under:

  The Artistic License 2.0 (GPL Compatible)

=cut
