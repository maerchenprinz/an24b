var myrange = 1 ;
var DepartApt = findAirportsWithinRange(myrange, "airport");
foreach(var myapt; DepartApt){
print(myapt.id);
}

var myapt2 = getprop("/sim/airport/closest-airport-id");
var info = airportinfo(myapt2);


foreach(var rwy; keys(info.runways)) {

print( info.runways[rwy].heading );
print( info.runways[rwy].threshold );
print(size([info.runways[rwy]]));
}

