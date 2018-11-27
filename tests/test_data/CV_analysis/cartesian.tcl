cv molid top
cv configfile [lindex $argv 0]
set basename "cartesian"
set file [open "${basename}_cartesian.log" w]
puts -nonewline $file [cv printframelabels]
set n [expr {int([molinfo top get numframes])}]
for {set i 0 } { $i < $n } { incr i } {
    cv frame $i
    cv update
    set coordinates [cv printframe]
    puts -nonewline $file $coordinates
    unset coordinates
}
close $file
cv delete
exit