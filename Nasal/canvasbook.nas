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
var path = "Models/Interior/Extras/DC_electrics.png";
var child = groupDC.createChild("image")
    .setFile(path)
    .setTranslation(0, 0)
    .setSize(1024, 1024);

canvas.parsesvg(groupDC, "Models/Interior/Extras/DC_electrics.svg");

###############
# CONNECTIONS
###############
var CONN_TsRUl_TsRUr_color = func {
	var PATH_TsRUl_TsRUr = groupDC.getElementById("PATH_TsRUl-TsRUr");
	var CONN_TsRUl_TsRUr = getprop("an24/Electrics/CONN_TsRUl-TsRUr");
#	var FUSE_TsRUl_TsRUr = getprop("an24/Electrics/FUSE_TsRUl-TsRUr");
	if ( CONN_TsRUl_TsRUr == 0 ) {
	PATH_TsRUl_TsRUr.setColor(1,0,0);
	}
#	else if ( CONN_TsRUl_RK_FlAttmain == 0 ) {
#	PATH_TsRUl_TsRUr.setColor(0,0,1);
#	}
	else {
	PATH_TsRUl_TsRUr.setColor(0,1,0);
	PATH_TsRUl_TsRUr.setStrokeDashArray([8,6]);
	}
}
 setlistener("an24/Electrics/CONN_TsRUl-TsRUr", CONN_TsRUl_TsRUr_color, 1, 0 );


var CONN_TsRUl_RK_FlAttmain_color = func {
	var PATH_TsRUl_sw1510 = groupDC.getElementById("PATH_TsRUl-sw1510");
	var CONN_TsRUl_RK_FlAttmain = getprop("an24/Electrics/CONN_TsRUl-RK_FlAttmain");
	var FUSE_TsRUl_RK_FlAttmain = getprop("an24/Electrics/FUSE_TsRUl-RK_FlAttmain");
	if ( FUSE_TsRUl_RK_FlAttmain == 0 ) {
	PATH_TsRUl_sw1510.setColor(1,0,0);
	}
	else if ( CONN_TsRUl_RK_FlAttmain == 0 ) {
	PATH_TsRUl_sw1510.setColor(0,0,0);
	}
	else {
	PATH_TsRUl_sw1510.setColor(0,1,0);
	}
}
 setlistener("an24/Electrics/CONN_TsRUl-RK_FlAttmain", CONN_TsRUl_RK_FlAttmain_color, 1, 0 );

var CONN_TsRUr_RK_FlAttmain_color = func {
	var PATH_TsRUR_sw1510 = groupDC.getElementById("PATH_TsRUr-sw1510");
	var CONN_TsRUr_RK_FlAttmain = getprop("an24/Electrics/CONN_TsRUr-RK_FlAttmain");
	var FUSE_TsRUr_RK_FlAttmain = getprop("an24/Electrics/FUSE_TsRUr-RK_FlAttmain");
	if ( FUSE_TsRUr_RK_FlAttmain == 0 ) {
	PATH_TsRUR_sw1510.setColor(1,0,0);
	}
	else if ( CONN_TsRUr_RK_FlAttmain == 0 ) {
	PATH_TsRUR_sw1510.setColor(0,0,0);
	}
	else {
	PATH_TsRUR_sw1510.setColor(0,1,0);
	}
}
 setlistener("an24/Electrics/CONN_TsRUr-RK_FlAttmain", CONN_TsRUr_RK_FlAttmain_color, 1, 0 );
# setlistener("an24/Electrics/FUSE_TsRUr-RK_FlAttmain", CONN_TsRUr_RK_FlAttmain_color, 1, 0 );

var CONN_CrewCab_RK_Navmain_color = func {
	var PATH_RK_CrewCab_RK_Navmain = groupDC.getElementById("PATH_RK_CrewCab-RK_Navmain");
	var CONN_RK_CrewCab_RK_Navmain = getprop("an24/Electrics/CONN_RK_CrewCab-RK_Navmain");
	var FUSE_RK_CrewCab_RK_Navmain = getprop("an24/Electrics/FUSE_RK_CrewCab-RK_Navmain");
	if ( FUSE_RK_CrewCab_RK_Navmain == 0 ) {
	PATH_RK_CrewCab_RK_Navmain.setColor(1,0,0);
#	PATH_RK_CrewCabin_RK_Navmain.StrokeLineWidth(2);
#	PATH_RK_CrewCabin_RK_Navmain.setVisible(0);
#	PATH_TsRUl_TsRUr.setStrokeDashArray([8,6]);
	}
	else if ( CONN_RK_CrewCab_RK_Navmain == 0 ) {
	PATH_RK_CrewCab_RK_Navmain.setColor(0,0,0);

	}
	else {
	PATH_RK_CrewCab_RK_Navmain.setColor(0,1,0);
	}
}
 setlistener("an24/Electrics/CONN_RK_CrewCab-RK_Navmain", CONN_CrewCab_RK_Navmain_color, 1, 0 );
# setlistener("an24/Electrics/FUSE_RK_CrewCab-RK_Navmain", CONN_CrewCab_RK_Navmain_color, 0, 0 );

var CONN_AZSmain_RK_Navmain_color = func {
	var PATH_AZSmain_RK_Navmain = groupDC.getElementById("PATH_AZSmain-RK_Navmain");
	var CONN_AZSmain_RK_Navmain = getprop("an24/Electrics/CONN_AZSmain-RK_Navmain");
	var FUSE_AZSmain_RK_Navmain = getprop("an24/Electrics/FUSE_AZSmain-RK_Navmain");
	if ( FUSE_AZSmain_RK_Navmain == 0 ) {
	PATH_AZSmain_RK_Navmain.setColor(1,0,0);
	}
	else if ( CONN_AZSmain_RK_Navmain == 0 ) {
	PATH_AZSmain_RK_Navmain.setColor(0,0,0);
	}
	else {
	PATH_AZSmain_RK_Navmain.setColor(0,1,0);
	}
}
 setlistener("an24/Electrics/CONN_AZSmain-RK_Navmain", CONN_AZSmain_RK_Navmain_color, 1, 0 );
# setlistener("an24/Electrics/FUSE_AZSmain-RKNavmain", CONN_AZSmain_RK_Navmain_color, 0, 0 );

var CONN_TsRUr_RK_CrewCab_color = func {
	var PATH_TsRUr_RK_CrewCab1 = groupDC.getElementById("PATH_TsRUr-RK_CrewCab1");
	var PATH_TsRUr_RK_CrewCab2 = groupDC.getElementById("PATH_TsRUr-RK_CrewCab2");
	var CONN_TsRUr_RK_CrewCab1 = 0 ;
	var CONN_TsRUr_RK_CrewCab2 = 0 ;
	var FUSE_TsRUr_RK_CrewCab1a = getprop("an24/Electrics/FUSE_TsRUr-RK_CrewCab1a");
	var FUSE_TsRUr_RK_CrewCab1b = getprop("an24/Electrics/FUSE_TsRUr-RK_CrewCab1b");
	var FUSE_TsRUr_RK_CrewCab2a = getprop("an24/Electrics/FUSE_TsRUr-RK_CrewCab2a");
	var FUSE_TsRUr_RK_CrewCab2b = getprop("an24/Electrics/FUSE_TsRUr-RK_CrewCab2b");

	if ( FUSE_TsRUr_RK_CrewCab1a == 0 or FUSE_TsRUr_RK_CrewCab1b == 0 ) {
	PATH_TsRUr_RK_CrewCab1.setColor(1,0,0);
	var CONN_TsRUr_RK_CrewCab1 = 0 ;
	}
	else {
	PATH_TsRUr_RK_CrewCab1.setColor(0,1,0);
	var CONN_TsRUr_RK_CrewCab1 = 1 ;
	}

	if ( FUSE_TsRUr_RK_CrewCab2a == 0 or FUSE_TsRUr_RK_CrewCab2b == 0 ) {
	PATH_TsRUr_RK_CrewCab2.setColor(1,0,0);
	var CONN_TsRUr_RK_CrewCab2 = 0 ;
	}
	else {
	PATH_TsRUr_RK_CrewCab2.setColor(0,1,0);
	var CONN_TsRUr_RK_CrewCab2 = 1 ;
	}

	if ( CONN_TsRUr_RK_CrewCab1 == 1 and CONN_TsRUr_RK_CrewCab2 == 0 ) {
	PATH_TsRUr_RK_CrewCab1.setColor(1,0.4,0);
	}

	if ( CONN_TsRUr_RK_CrewCab1 == 0 and CONN_TsRUr_RK_CrewCab2 == 1 ) {
	PATH_TsRUr_RK_CrewCab2.setColor(1,0.4,0);
	}

}
 setlistener("an24/Electrics/FUSE_TsRUr-RK_CrewCab1a", CONN_TsRUr_RK_CrewCab_color, 1, 0 );
 setlistener("an24/Electrics/FUSE_TsRUr-RK_CrewCab1b", CONN_TsRUr_RK_CrewCab_color, 0, 0 );
 setlistener("an24/Electrics/FUSE_TsRUr-RK_CrewCab2a", CONN_TsRUr_RK_CrewCab_color, 0, 0 );
 setlistener("an24/Electrics/FUSE_TsRUr-RK_CrewCab2b", CONN_TsRUr_RK_CrewCab_color, 0, 0 );

var CONN_TsRUl_AZSmain_color = func {
	var PATH_TsRUl_AZSmain1 = groupDC.getElementById("PATH_TsRUl-AZSmain1");
	var PATH_TsRUl_AZSmain2 = groupDC.getElementById("PATH_TsRUl-AZSmain2");
	var CONN_TsRUl_AZSmain1 = 0 ;
	var CONN_TsRUl_AZSmain2 = 0 ;
	var FUSE_TsRUl_AZSmain1a = getprop("an24/Electrics/FUSE_TsRUl-AZSmain1a");
	var FUSE_TsRUl_AZSmain1b = getprop("an24/Electrics/FUSE_TsRUl-AZSmain1b");
	var FUSE_TsRUl_AZSmain2a = getprop("an24/Electrics/FUSE_TsRUl-AZSmain2a");
	var FUSE_TsRUl_AZSmain2b = getprop("an24/Electrics/FUSE_TsRUl-AZSmain2b");

	if ( FUSE_TsRUl_AZSmain1a == 0 or FUSE_TsRUl_AZSmain1b == 0 ) {
	PATH_TsRUl_AZSmain1.setColor(1,0,0);
	var CONN_TsRUl_AZSmain1 = 0 ;
	}
	else {
	PATH_TsRUl_AZSmain1.setColor(0,1,0);
	var CONN_TsRUl_AZSmain1 = 1 ;
	}

	if ( FUSE_TsRUl_AZSmain2a == 0 or FUSE_TsRUl_AZSmain2b == 0 ) {
	PATH_TsRUl_AZSmain2.setColor(1,0,0);
	var CONN_TsRUl_AZSmain2 = 0 ;
	}
	else {
	PATH_TsRUl_AZSmain2.setColor(0,1,0);
	var CONN_TsRUl_AZSmain2 = 1 ;
	}

	if ( CONN_TsRUl_AZSmain1 == 1 and CONN_TsRUl_AZSmain2 == 0 ) {
	PATH_TsRUl_AZSmain1.setColor(1,0.9,0);
	}

	if ( CONN_TsRUl_AZSmain1 == 0 and CONN_TsRUl_AZSmain2 == 1 ) {
	PATH_TsRUl_AZSmain2.setColor(1,0.9,0);
	}

}
 setlistener("an24/Electrics/FUSE_TsRUl-AZSmain1a", CONN_TsRUl_AZSmain_color, 1, 0 );
 setlistener("an24/Electrics/FUSE_TsRUl-AZSmain1b", CONN_TsRUl_AZSmain_color, 0, 0 );
 setlistener("an24/Electrics/FUSE_TsRUl-AZSmain2a", CONN_TsRUl_AZSmain_color, 0, 0 );
 setlistener("an24/Electrics/FUSE_TsRUl-AZSmain2b", CONN_TsRUl_AZSmain_color, 0, 0 );

var CONN_TsRUl_RK_Fuel_color = func {
	var PATH_TsRUl_RK_Fuel = groupDC.getElementById("PATH_TsRUl-RK_FuelPumps");
	var CONN_TsRUl_RK_Fuel = getprop("an24/Electrics/CONN_TsRUl-RK_FuelPumps");
	var FUSE_TsRUl_RK_Fuel = getprop("an24/Electrics/FUSE_TsRUl-RK_FuelPumps");
	if ( FUSE_TsRUl_RK_Fuel == 0 ) {
	PATH_TsRUl_RK_Fuel.setColor(1,0,0);
	}
	else if ( CONN_TsRUl_RK_Fuel == 0 ) {
	PATH_TsRUl_RK_Fuel.setColor(0,0,0);
	}
	else {
	PATH_TsRUl_RK_Fuel.setColor(0,1,0);
	}
}
 setlistener("an24/Electrics/CONN_TsRUl-RK_FuelPumps", CONN_TsRUl_RK_Fuel_color, 1, 0 );

var CONN_TsRUr_RK_Fuel_color = func {
	var PATH_TsRUr_RK_Fuel = groupDC.getElementById("PATH_TsRUr-RK_FuelPumps");
	var CONN_TsRUr_RK_Fuel = getprop("an24/Electrics/CONN_TsRUr-RK_FuelPumps");
	var FUSE_TsRUr_RK_Fuel = getprop("an24/Electrics/FUSE_TsRUr-RK_FuelPumps");
	if ( FUSE_TsRUr_RK_Fuel == 0 ) {
	PATH_TsRUr_RK_Fuel.setColor(1,0,0);
	}
	else if ( CONN_TsRUr_RK_Fuel == 0 ) {
	PATH_TsRUr_RK_Fuel.setColor(0,0,0);
	}
	else {
	PATH_TsRUr_RK_Fuel.setColor(0,1,0);
	}
}
 setlistener("an24/Electrics/CONN_TsRUr-RK_FuelPumps", CONN_TsRUr_RK_Fuel_color, 1, 0 );

var CONN_AZSmain_RK_Radiomain_color = func {
	var PATH_AZSmain_RK_Radiomain1 = groupDC.getElementById("PATH_AZSmain-rl954");
	var CONN_AZSmain_RK_Radiomain = getprop("an24/Electrics/CONN_AZSmain-RK_Radiomain");
	var FUSE_AZSmain_RK_Radiomain = getprop("an24/Electrics/FUSE_AZSmain-RK_Radiomain");
	if ( FUSE_AZSmain_RK_Radiomain == 0 ) {
	PATH_AZSmain_RK_Radiomain1.setColor(1,0,0);
	}
	else if ( CONN_AZSmain_RK_Radiomain == 0 ) {
	PATH_AZSmain_RK_Radiomain1.setColor(0,0,0);
	}
	else {
	PATH_AZSmain_RK_Radiomain1.setColor(0,1,0);
	}
}
 setlistener("an24/Electrics/CONN_AZSmain-RK_Radiomain", CONN_AZSmain_RK_Radiomain_color, 1, 0 );

var CONN_RK_CrewCab_RK_Radiomain_color = func {
	var PATH_RK_CrewCab_RK_Radiomain1 = groupDC.getElementById("PATH_RK_CrewCab-rl954");
	var CONN_RK_CrewCab_RK_Radiomain = getprop("an24/Electrics/CONN_RK_CrewCab-RK_Radiomain");
	var FUSE_RK_CrewCab_RK_Radiomain = getprop("an24/Electrics/FUSE_RK_CrewCab-RK_Radiomain");
	if ( FUSE_RK_CrewCab_RK_Radiomain == 0 ) {
	PATH_RK_CrewCab_RK_Radiomain1.setColor(1,0,0);
	}
	else if ( CONN_RK_CrewCab_RK_Radiomain == 0 ) {
	PATH_RK_CrewCab_RK_Radiomain1.setColor(0,0,0);
	}
	else {
	PATH_RK_CrewCab_RK_Radiomain1.setColor(0,1,0);
	}
}
 setlistener("an24/Electrics/CONN_RK_CrewCab-RK_Radiomain", CONN_RK_CrewCab_RK_Radiomain_color, 1, 0 );

var CONN_RK_CrewCab_AZSmain_color = func {
	var PATH_RK_CrewCab_AZSmain = groupDC.getElementById("PATH_RK_CrewCab-AZSmain");
	var CONN_RK_CrewCab_AZSmain = getprop("an24/Electrics/CONN_RK_CrewCab-AZSmain");
	var FUSE_RK_CrewCab_AZSmaina = getprop("an24/Electrics/FUSE_RK_CrewCab-AZSmaina");
	var FUSE_RK_CrewCab_AZSmainb = getprop("an24/Electrics/FUSE_RK_CrewCab-AZSmainb");
	if ( FUSE_RK_CrewCab_AZSmaina == 0 or FUSE_RK_CrewCab_AZSmainb == 0) {
	PATH_RK_CrewCab_AZSmain.setColor(1,0,0);
	}
	else if ( CONN_RK_CrewCab_AZSmain == 0 ) {
	PATH_RK_CrewCab_AZSmain.setColor(0,0,0);
	}
	else {
	PATH_RK_CrewCab_AZSmain.setColor(0,1,0);
	}
}
 setlistener("an24/Electrics/CONN_RK_CrewCab-AZSmain", CONN_RK_CrewCab_AZSmain_color, 1, 0 );

var CONN_AZSemerg_RK_FlAttemerg_color = func {
	var PATH_AZSemerg_RK_FlAttemerg = groupDC.getElementById("PATH_FUSE_AZR20-RK_FlAttemerg");
	var CONN_AZSemerg_RK_FlAttemerg = getprop("an24/Electrics/CONN_AZSemerg-RK_FlAttemerg");
	var FUSE_AZSemerg_RK_FlAttemerg = getprop("an24/Electrics/FUSE_AZSemerg-RK_FlAttemerg");
	if ( FUSE_AZSemerg_RK_FlAttemerg == 0 ) {
	PATH_AZSemerg_RK_FlAttemerg.setColor(1,0,0);
	}
#	else if ( CONN_AZSemerg_RK_FlAttemerg == 0 ) {
#	PATH_AZSemerg_RK_FlAttemerg.setColor(0,0,0);
#	}
	else {
	PATH_AZSemerg_RK_FlAttemerg.setColor(0,1,0);
	}
}
 setlistener("an24/Electrics/CONN_AZSemerg-RK_FlAttemerg", CONN_AZSemerg_RK_FlAttemerg_color, 1, 0 );

###############
# SOURCES
###############
var Accu1_color = func {
	var RECT_Accu1 = groupDC.getElementById("Accu1");
	var Accu1_V = getprop("an24/Electrics/DC_Batt_12SAM1_V");
	if ( Accu1_V > 22.0 ) {
	RECT_Accu1.setColorFill(0,1,0);
	}
	else if ( Accu1_V > 20.0 ) {
	RECT_Accu1.setColorFill(1,1,0);
	}
	else {
	RECT_Accu1.setColorFill(1,0,0);
	}
}
 setlistener("an24/Electrics/DC_Batt_12SAM1_V", Accu1_color, 1, 0 );

var Accu2_color = func {
	var RECT_Accu2 = groupDC.getElementById("Accu2");
	var Accu2_V = getprop("an24/Electrics/DC_Batt_12SAM2_V");
	if ( Accu2_V > 22.0 ) {
	RECT_Accu2.setColorFill(0,1,0);
	}
	else if ( Accu2_V > 20.0 ) {
	RECT_Accu2.setColorFill(1,1,0);
	}
	else {
	RECT_Accu2.setColorFill(1,0,0);
	}
}
 setlistener("an24/Electrics/DC_Batt_12SAM2_V", Accu2_color, 1, 0 );

var V1_STG18L_text = func {
	var text_V1_STG18L = groupDC.getElementById("text_V1_STG18L");
	var V1_STG18L_V = getprop("/an24/Electrics/DC_Gen_18TMOl_V");
	text_V1_STG18L.setText(sprintf("%.1f",V1_STG18L_V));
}
 setlistener("/an24/Electrics/DC_Gen_18TMOl_V", V1_STG18L_text, 1, 0 );

var V1_STG18R_text = func {
	var text_V1_STG18R = groupDC.getElementById("text_V1_STG18R");
	var V1_STG18R_V = getprop("/an24/Electrics/DC_Gen_18TMOr_V");
	text_V1_STG18R.setText(sprintf("%.1f",V1_STG18R_V));
}
 setlistener("/an24/Electrics/DC_Gen_18TMOr_V", V1_STG18R_text, 1, 0 );

###############
# RKs
###############
var V1_Accus_text = func {
	var text_V1_Accus = groupDC.getElementById("text_V1_Accus");
	var V1_Accus_V = getprop("/an24/Electrics/RK_Akku_V");
	text_V1_Accus.setText(sprintf("%.1f",V1_Accus_V));
}
 setlistener("/an24/Electrics/RK_Akku_V", V1_Accus_text, 1, 0 );

###############
# Start Sequence
###############
var Rotate_Direction_DMRl = func {
	var Direction_DMRl = groupDC.getElementById("Direction_DMRl");
	var ContactorL = getprop("an24/Electrics/DMR-600Tl");
	if ( ContactorL == 0 ) {
	Direction_DMRl.setColorFill(1,0,0);
	}
	if ( ContactorL == 1 ) {
	Direction_DMRl.setColorFill(0,1,0);
	}
}
 setlistener("an24/Electrics/DMR-600Tl", Rotate_Direction_DMRl, 1, 0 );
