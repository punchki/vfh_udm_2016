# vfh_udm_2016

VFH Algorithm for Hardware Software Integration

theading = calcTarg(target pos, current pos, current heading)

M = calcDanger(lidar, max range (optional))

h = Calch(m, sectorsize, currentresolution)

h_prime=Calchprime(h , l(width of filter))

Hb = CalcH(h_prime,thresh)

valley_arr = findValley(Hb, min_valley)

valley_chosen = pickValley(valley_chosen, theading)

newheading, chosensector = chooseSector(valley_chosen, theading, narrow_valley_size_req)

linspeed, angularspeed = detVelocity(chosenHeading, h_prime, linmax, angularmax) 
