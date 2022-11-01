#!/usr/bin/perl -w

use strict;

system("logger", "Script $0 started.");
my $RANDOM_FILE_NAME=`perl -e 'print[0..9,a..z,A..Z]->[rand 16] for 1..6'`;
system("logger", "Random file name is generated.");
open(my $FILE_HANDLER, '>', "$RANDOM_FILE_NAME");
system("logger", "Random file has been created");
my $FILES_TO_DEL=`/usr/bin/find . -maxdepth 1 -type f -not -path $0 -mmin +1 | /usr/bin/xargs rm -f`;
system("logger", "Files older than 1 minute were removed.");
