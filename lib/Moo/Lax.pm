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
  $Moo::Lax::VERSION = '0.13';
}

#ABSTRACT: Loads Moo without turning warnings to fatal.


use strict;
use warnings;

use Moo ();
use Import::Into;

sub import {
    no warnings 'uninitialized';
    my $previous_bits = ${^WARNING_BITS} & $warnings::DeadBits{all};
    local $ENV{PERL_STRICTURES_EXTRA} = 0;
    Moo->import::into(caller, @_);
    ${^WARNING_BITS} &= ~$warnings::DeadBits{all} | $previous_bits;
    return;
}

1

__END__

=pod

=encoding UTF-8

=head1 NAME

Moo::Lax - Loads Moo without turning warnings to fatal.

=head1 VERSION

version 0.13

=head1 SYNOPSIS

  # instead of use Moo;
  use Moo::Lax;

=head1 DESCRIPTION

By default Moo turns all warnings to fatal warnings. C<Moo::Lax> is exactly the
same as C<Moo>, except that it doesn't turn all warnings to fatal warnings in
the calling module.

=head1 CONTRIBUTORS

=over

=item *

Leon Timmermans

=back

=head1 AUTHOR

Damien Krotkine <dams@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is Copyright (c) 2014 by Damien Krotkine.

This is free software, licensed under:

  The Artistic License 2.0 (GPL Compatible)

=cut
