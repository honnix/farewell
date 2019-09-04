#!/usr/bin/env perl

my $key = "i hope in the next ten years there would be no other farewell letter brilliant than this one";

open FILE, "$ARGV[0]" or die $!;
my ($content, $buffer, $n);
while (($n = read FILE, $buffer, 32) != 0) {
  $content .= $buffer;
}
close(FILE);

$content =~ s/\s//g;
my @encrypted = split(/,/, $content);
my $length = @encrypted;

my @decrypted;
for (my $i = 0; $i < $length; ++$i) {
    my $tmp = int(@encrypted[$i]) ^ ord(substr($key, $i % length($key), 1));
    push(@decrypted, chr($tmp));
}

print @decrypted;
