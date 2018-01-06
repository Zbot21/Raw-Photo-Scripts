use strict;
use warnings;
use List::MoreUtils qw(uniq);

my $directory = $ARGV[0];
my %raw_files = map {$_ => 1} glob("$directory/*.cr2");
my @jpg_files = uniq(glob "$directory/*.{JPG,jpg}");
foreach my $file (@jpg_files) {
	$file =~ s/.(JPG|jpg)//;
	if (!exists($raw_files{"$file.CR2"}) and !exists($raw_files{"$file.cr2"})) {
		print "Deleting $file.(jpg|JPG)";
		if (-f "$file\.jpg") {
			unlink "$file.jpg";
		}
		if (-f "$file\.JPG") {
			unlink "$file.JPG";
		}
	}
}