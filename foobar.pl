#	Foobar script by danielegt2
#	Displays song playing in foobar
#
#	Usage: If you want to share what song you're listening to just use /foobar, it's easy!
#
#	last update: 02/12/2014

use strict;
use warnings;
use HexChat qw(:all);
use IO::Handle;

register('Foobar script', '1.0', 'displays song playing in foobar', \&end);

my $help = 'just use /foobar, it\'s easy!';
hook_command( 'foobar', \&foo, { help_text  => $help, });
prnt('Foobar script loaded');


sub foo{
	open(FILE, 'np.txt');
	local $/;
	my $foostring = <FILE>;
	close (FILE);
	if("$foostring" eq "paused")
	{
		command ('echo foobar is paused');
	}else
	{
		if("$foostring" eq "stopped")
		{
			command ('echo foobar is stopped');
		}else
		{
			if("$foostring" eq "not running")
			{
				command ('echo foobar isn\'t running');
			}else
			{
				command ("me is now playing: $foostring");
			}
		}
	}
	return 1;
}

sub end{
	prnt('Foobar script unloaded');
}
