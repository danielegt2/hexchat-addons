#	DND script by danielegt2
#	Adds some features to the away command
#
#	Usage: away <word> [reason], <word> will be added to your nick like this: <yournick|word>.
#	Like vanilla AWAY, [reason] isn\'t necessary, if you simply write "/away", <away> will be added to your nick
#	Usage: back, sets you back and removes <word> or <away> from your nick
#
#	last update: 14/11/2014

use strict;
use warnings;
use HexChat qw(:all);

my $nickname = get_info( 'nick' );
my $helpa = 'Usage: away <word> [reason], <word> will be added to your nick like this: <yournick|word>. Like vanilla AWAY, [reason] isn\'t necessary, if you simply write "/away", <away> will be added to your nick';
my $helpb = 'Usage: back, sets you back and removes <word> or <away> from your nick';
my $vary = 0;

register('DND script', '1.0', 'adds some features to the away command', \&end);
hook_command( 'away', \&dnd, { help_text  => $helpa, });
hook_command( 'back', \&imback, { help_text  => $helpb, });
hook_command( 'nick', \&cnick);

prnt('DND script loaded');

sub cnick{
	command ($_[1][0]);
	if ($vary == 0)
	{
		$nickname = $_[0][1];
	}
	$vary = 0;
	return 1;
}

sub dnd{
	$vary = 1;
	if (defined $_[0][1] and defined $_[0][2]) {
		command ('nick ' .$nickname. '|' .$_[0][1]);
		command ($_[0][0].' '.$_[1][2]);
	}else{
		if(defined $_[0][1]){
			command ('nick ' .$nickname. '|' .$_[0][1]);
			command ($_[0][0]);
		}else{
			command ('nick ' .$nickname. '|away');
			command ($_[0][0]);
		}
	}
	return 1;
}

sub imback{
	$vary = 1;
	command ('nick ' .$nickname);
	command($_[1][0]);
	return 1;
}

sub end{
	prnt('DND script unloaded');
}
