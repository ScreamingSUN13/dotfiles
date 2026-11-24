#!/bin/sh
# run inside this folder after unzipping
ln -sf 08_notes.txt 82_symlink_ok
ln -sf does_not_exist 83_symlink_broken
ln -sf 81_dir_with_files 84_symlink_to_dir
