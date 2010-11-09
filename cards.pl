use strict;
$|=1;

my $limit = 10; # Ask for a number between 1 and this number

my $number_of_cards = length(dec2bin($limit));

# initialize the sub-arrays, one per card
my @cards;
foreach my $i (0..$number_of_cards){
	$cards[$i] = ();
}

foreach my $n (1..$limit){
	my $bin = dec2bin($n);
	$bin = reverse $bin;
	my @flags = split(//,$bin);
	my $c=0;
	foreach(@flags){
		$c++;
		if($_){
			#print "card $c gets $n\n";
			push @{$cards[$c]}, $n;
			
		}
	}
}

for(my $card=1; $card<=$number_of_cards; $card++){
	print "Card $card (".scalar(@{$cards[$card]}).")\n";
	print "-------\n";
	foreach(@{$cards[$card]}){
		print "$_ ";
	}
	print "\n\n";
}

sub dec2bin {
    my $str = unpack("B32", pack("N", shift));
    $str =~ s/^0+(?=\d)//;   # otherwise you'll get leading zeros
    return $str;
}
