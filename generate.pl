#!/usr/bin/perl
use strict;
use File::Slurp qw( read_file );
use Digest::MD5 qw( md5_base64 );

my (@head_lines, @body_lines);

push @head_lines, read_file("meta.txt");
push @head_lines, sprintf("! Version: %d\n", time);
push @body_lines, read_file("filters.txt");

my $check = join("", @head_lines, @body_lines);
$check =~ s{\r}{}g;
$check =~ s{\n+}{\n}g;

my $chksum = md5_base64($check);
$chksum =~ s/=//g;

print for @head_lines;
printf "! Checksum: %s\n\n", $chksum;
print for @body_lines;
