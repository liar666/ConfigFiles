#!/bin/sh
xinput list | sed -ne 's/^[^ ][^V].*id=\([0-9]*\).*/\1/p' | while read id
do
        case `xinput list-props $id` in
        *"Middle Button Emulation"*)
                xinput set-int-prop $id "Middle Button Emulation" 8 0
                ;;
        esac
done
