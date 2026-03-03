var Book1canvas = canvas.new({
  "name": "DC-System",   # The name is optional but allow for easier identification
  "size": [1024, 1024], # Size of the underlying texture (should be a power of 2, required) [Resolution]
  "view": [1024, 1024],  # Virtual resolution (Defines the coordinate system of the canvas [Dimensions]
                        # which will be stretched the size of the texture, required)
  "mipmapping": 0       # Enable mipmapping (optional)
});

# Place it on all objects called Book1Page1
Book1canvas.addPlacement({"node": "Book1Page1"});
Book1canvas.set("background", "#ffffff");

var groupDC = Book1canvas.createGroup();

# Raster image
var path = "Aircraft/an24b/Models/Interior/Extras/DC_electrics.png";
var child = groupDC.createChild("image")
    .setFile(path)
    .setTranslation(0, 0)
    .setSize(1024, 1024);

canvas.parsesvg(groupDC, "Aircraft/an24b/Models/Interior/Extras/DC_electrics.svg");

###############
# CONNECTIONS
###############
var RK_CrewCabin_RK_Navmain = func {
	var PATH_RK_CrewCabin_RK_Navmain = groupDC.getElementById("CONN_RK_CrewCabin-RK_Navmain");
	var CONN_RK_CrewCabin_RK_Navmain = getprop("/an24/Electrics/CONN_RKCrewCab-RKNavmain");
	var FUSE_RK_CrewCabin_RK_Navmain = getprop("/an24/Electrics/FUSE_RKCrewCab-RKNavmain");
	if ( CONN_RK_CrewCabin_RK_Navmain == 1.0 ) {
	PATH_RK_CrewCabin_RK_Navmain.setColor(0,1,0);
	}
	else if ( FUSE_RK_CrewCabin_RK_Navmain == 1.0 ) {
	PATH_RK_CrewCabin_RK_Navmain.setColor(0,0,1);
	}
	else {
	PATH_RK_CrewCabin_RK_Navmain.setColor(1,0,0);
	PATH_RK_CrewCabin_RK_Navmain.setColor(1,0,0);
	}
}
 setlistener("/an24/Electrics/CONN_RKCrewCab-RKNavmain", RK_CrewCabin_RK_Navmain, 1, 0 );

var transformtest = func {
	var testtf = groupDC.getElementById("BUSBAR_RK_Accua");
	var testtf2 = getprop("/an24/Electrical_Panel/sw_gs24");
	if ( testtf2 == 1.0 ) {
	testtf.setColor(1,0,0);
	testtf.set("background", "1,0,0");
	}
	else {
	testtf.setColor(1,1,0);
	testtf.set("background", "1,0,0");
	}
}
# setlistener("/an24/Electrical_Panel/sw_gs24", transformtest, 1, 0 );

###############
# TEXTS
###############
var V1_Accus = func {
	var text_V1_Accus = groupDC.getElementById("text_V1_Accus");
	var V1_Accus_V = getprop("/an24/Electrics/RKAkku_V");
	text_V1_Accus.setText(sprintf("%.1f",V1_Accus_V));
}
 setlistener("/an24/Electrics/RKAkku_V", V1_Accus, 1, 0 );

var mp_stopwatch = maketimer(1, func(){
	var speedup = getprop("sim/speed-up");
	var sw_time = getprop("an24/AChS/mp_stopwatch");
	var sw_time = sw_time + speedup ;
	setprop("an24/AChS/mp_stopwatch", int(sw_time));
});

var V1_STG18R = func {
	var text_V1_STG18R = groupDC.getElementById("text_V1_STG18R");
	var V1_STG18R_V = getprop("/an24/Electrics/DC_Gen_18TMOr_V");
	text_V1_STG18R.setText(sprintf("%.1f",V1_STG18R_V));
}
 setlistener("/an24/Electrics/DC_Gen_18TMOr_V", V1_STG18R, 1, 0 );
