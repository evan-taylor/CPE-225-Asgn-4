# add
# div
# andnums
# lshiftnums

.global addnums, divnums, andnums, lshiftnums

.text

addnums:
    add a0, a0, a1  # a0 = a0 + a1
    ret             # return to caller
    
divnums:
    div a0, a0, a1  # Divide a0 by a1; result in a0
    ret             # Return to caller
    
andnums:
    and a0, a0, a1  # Perform AND on a0 and a1; store result in a0
    ret             # Return to caller
    
lshiftnums:
    sll a0, a0, a1  # Shift the value in a0 left by the number of positions in a1
    ret             # Return to the caller
	
	