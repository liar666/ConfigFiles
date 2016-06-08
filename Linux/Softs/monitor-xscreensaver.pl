#!/usr/bin/perl

my $blanked = 0;
open (IN, "xscreensaver-command -watch |");
while (<IN>) {
    if (m/^(BLANK|LOCK)/) {
        if (!$blanked) {
            system "sound-off";
            $blanked = 1;
        }
    } elsif (m/^UNBLANK/) {
        system "sound-on";
        system ". ~/Softs/set_keyboard";
        $blanked = 0;
    }
}
