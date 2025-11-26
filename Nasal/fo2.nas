var myrange = 1 ;
var DepartApt = findAirportsWithinRange(myrange, "airport");
foreach(var myapt; DepartApt){
    print(myapt.id);
#var allapts = myapt.id
}

var info = airportinfo(myapt.id);
     summe = 0;
foreach(var rwy; keys(info.runways)){
     var summe = info.runways[rwy].threshold + summe;
    print( info.runways[rwy].stopway );

#    var rwysum = info.runways[rwy].length + info.runways[rwy].length;
     setprop("an24/fo_nearestrwyhdg", summe);
}

