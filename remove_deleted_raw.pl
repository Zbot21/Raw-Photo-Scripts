my $directory = $ARGV[0];
print $directory
my %raw_files = map {$_ => 1} glob "$directory/*.{CR2,cr2}";
my @jpg_files = glob "$directory/*.{JPG,jpg}";
foreach $file (@jpg_files) {
	print $file
	$file =~ s/.(JPG|jpg)//;
	if (!exists($raw_files{"$file.CR2"})) {
		print "Deleting $file.CR2\n"
		unlink "$file.CR2"
	}
	if (!exists($raw_files{"$file.cr2"})) {
		print "Deleting $file.cr2\n"
		unlink "$file.cr2"
	}
}