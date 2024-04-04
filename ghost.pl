#	Ghost script by danielegt2
#	No more ghost nicks!
#
#	Usage: If you want to get rid of a ghost just use /ghost, it's easy!
#
#	last update: 27/01/2015

use strict;
use warnings;
use HexChat qw(:all);

register('Ghost script', '1.0', 'No more ghost nicks!', \&end);

my $help = 'just use /ghost, it\'s easy!';
hook_command( 'gn', \&gn, { help_text  => $help, });
prnt('Ghost script loaded');


sub gn{
	command ('ghost username password');
	command ('nick username');
	return 1;
}

sub end{
	prnt('Ghost script unloaded');
}
