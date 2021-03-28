#!/bin/bash

# Razer Tartarus has 2 keyboard IDs. God knows why.
remote_id=$(
    xinput list |
    sed -n 's/.*Tartarus.*id=\([0-9]*\).*keyboard.*/\1/p'
)

[ "$remote_id" ] || exit

# remap the following keys, only for my custom vintage atari joystick connected
# through an old USB keyboard:
#
# keypad 5 -> keypad 6
# . -> keypad 2
# [ -> keypad 8
# left shift -> left control

mkdir -p /tmp/xkb/symbols
# This is a name for the file, it could be anything you
# want. For us, we'll name it "custom". This is important
# later.
#
# The KP_* come from /usr/include/X11/keysymdef.h
# Also note the name, "remote" is there in the stanza
# definition.
cat >/tmp/xkb/symbols/custom <<\EOF

xkb_symbols "remote" {
    key <AE01> { [ Escape ] };
    key <TAB>  { [ 6 ] };
    key <AD01> { [ 7 ] };
    key <AD02> { [ 8 ] };
    key <AD03> { [ 9 ] };
    key <AD04> { [ 0 ] };
    key <CAPS> { [ q ] };
    key <AC01> { [ w ] };
    key <AC02> { [ e ] };
    key <AC03> { [ r ] };
    key <AC04> { [ a ] };
    key <LFSH> { [ s ] };
    key <AB01> { [ d ] };
    key <AB02> { [ f ] };
    key <AB03> { [ z ] };
    key <LCTL> { [ LAlt ] };
};
EOF

# (1) We list our current definition
# (2) Modify it to have a keyboard mapping using the name
#     we used above, in this case it's the "remote" definition
#     described in the file named "custom" which we specify in
#     this world as "custom(remote)".
# (3) Now we take that as input back into our definition of the
#     keyboard. This includes the file we just made, read in last,
#     so as to override any prior definitions.  Importantly we 
#     need to include the directory of the place we placed the file
#     to be considered when reading things in.
#
# Also notice that we aren't including exactly the 
# directory we specified above. In this case, it will be looking
# for a directory structure similar to /usr/share/X11/xkb
# 
# What we provided was a "symbols" file. That's why above we put
# the file into a "symbols" directory, which is not being included
# below.

ids=$(echo $remote_id | tr " " "\n")

for id in $ids
do
	echo Remapping device: $id
	setxkbmap -device $id -print \
	 | sed 's/\(xkb_symbols.*\)"/\1+custom(remote)"/' \
	 | xkbcomp -I/tmp/xkb -i $id -synch - $DISPLAY 2>/dev/null
done

echo Done!
