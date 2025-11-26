var fo1 = func () {
var info = airportinfo("airport");
#foreach(var rwy; keys(info.runways)){
	print(rwy);
#	var (course, dist) = courseAndDistance(info.runways[rwy]);
#	if ( dist < 1.0  ) {
#	var rwy = airportinfo().runway("18R");
#	setprop("an24/fo_nearestrwy", nearest );
#	setprop("an24/fo_nearestrwyhdg", info.runways[nearest].heading );
#	setprop("an24/fo_nearestrwycourse", course );
#	}
#	if ( info.runways[nearest].heading - 5 < course and info.runways[nearest].heading + 5 > course ) {
#	setprop("an24/fo_headingok", 1);
#	}
#	else {
#	setprop("an24/fo_headingok", 0);
#	}
#}


};
