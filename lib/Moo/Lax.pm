#
# This file is part of Moo-Lax
#
# This software is Copyright (c) 2014 by Damien Krotkine.
#
# This is free software, licensed under:
#
#   The Artistic License 2.0 (GPL Compatible)
#
package Moo::Lax;
{
  $Moo::Lax::VERSION = '0.11';
}

#ABSTRACT: By default Moo turns all warnings to fatal warnings. C<Moo::Lax> is exactly the same as C<Moo>, except that it doesn't turn all warnings to fatal warnings in the calling module.


use strict;
use warnings;

require strictures;
my $orig = \&strictures::import;
require Moo;
sub import {
    no warnings 'redefine';
    *strictures::import = sub {
        strict->import; warnings->import;
        *strictures::import = $orig;
    };
    splice @_, 0, 1, 'Moo'; goto &Moo::import;
}

1

__END__

=pod

=encoding UTF-8

=head1 NAME

Moo::Lax - By default Moo turns all warnings to fatal warnings. C<Moo::Lax> is exactly the same as C<Moo>, except that it doesn't turn all warnings to fatal warnings in the calling module.

=head1 VERSION

version 0.11

=head1 SYNOPSIS

  # instead of use Moo;
  use Moo::Lax;

=head1 AUTHOR

Damien Krotkine <dams@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is Copyright (c) 2014 by Damien Krotkine.

This is free software, licensed under:

  The Artistic License 2.0 (GPL Compatible)

=cut
