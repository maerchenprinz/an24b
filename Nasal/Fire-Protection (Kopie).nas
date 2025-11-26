##############################
# Belly landing switches
##############################
var BellySwitches = func {
	var BellySwitchFront = getprop("fdm/jsbsim/contact/unit[7]/compression-ft");
	var BellySwitchTail = getprop("fdm/jsbsim/contact/unit[5]/compression-ft");
	var BellySwitchAZSSwitch = getprop("an24/AZS/sw0210");
	var BellySwitchAZSEmergV = getprop("an24/Electrics/AZSemerg_V");
	if ( (BellySwitchFront > 0.4 or BellySwitchTail > 0.4) and BellySwitchAZSSwitch == 1.0 and BellySwitchAZSEmergV > 24.0 ) {
	setprop("an24/Fire-Protection/belly-switches", 1);
	}
}
 setlistener("fdm/jsbsim/contact/unit[5]/WOW", BellySwitches, 0, 0);
 setlistener("fdm/jsbsim/contact/unit[7]/WOW", BellySwitches, 0, 0);

##############################
# SSP Sensors and Valves Test
##############################
# Gr6: 1,2,3 Inner front wing, nacelle (combustor); BI-2 Sh.4, terminal 4
# Gr5: 4,5,6 Outer front wing, nacelle (combustor + compressor); BI-2 Sh.4, terminal 4
# Gr4: 7,8,9 Outmost front wing, nacelle (gear comp. + 4th comp.); BI-2 Sh.4, terminal 4

# Gr3: 10,11,12 Outmost back wing, nacelle (gear comp. + 4th comp.); BI-2 Sh.4, terminal 3
# Gr2: 13,14,15 Outer back wing, nacelle (5th + 4th comp.); BI-2 Sh.4, terminal 3
# Gr1: 16,17,18 Inner back wing, nacelle (5th comp.); BI-2 Sh.4, terminal 3

# DTB: 1,2 Left engine comp. and comb. stage
# DTB: 3,4 Right engine comp. and comb. stage

# _status: -1 broken, 0 not signaling, 1 signaling

var SensorsValves_test = func (groupselector) {
	if ( groupselector == 0 ) {
	Bi2Lnacelle(0,0,0,0,0,0);
	Bi2Lwing(0,0,0,0,0,0);
	Bi2Rnacelle(0,0,0,0,0,0);
	Bi2Rwing(0,0,0,0,0,0);
	Bi7engines(0,0,0,0);
	setprop("an24/Fire-Protection/Rel4237", 0);
	setprop("an24/Fire-Protection/Sensors/current_from", 0);
	}
	else if ( getprop("an24/FireFeather/main") == -1 and getprop("an24/Fire-Protection/power-left") == 1.0 ) {
		setprop("an24/Fire-Protection/Rel4237", 1);
		setprop("an24/Fire-Protection/Sensors/current_from", 1);
#		if ( groupselector == 1 ) {# Valves
#		Valves(1,0,0,0);	
#		}
		if ( groupselector == 2 ) {# DTB Nr.1
		Bi7engines(1,0,0,0);	
		}
		if ( groupselector == 3 ) {# DTB Nr.2
		Bi7engines(0,1,0,0);	
		}
		if ( groupselector == 4 ) {# DTB Nr.3
		Bi7engines(0,0,1,0);	
		}
		if ( groupselector == 5 ) {# DTB Nr.4
		Bi7engines(0,0,0,1);	
		}
		if ( groupselector == 6 ) {# Gr.6
		Bi2Lnacelle(0,0,0,0,0,1);
		Bi2Lwing(0,0,0,0,0,1);
		Bi2Rnacelle(0,0,0,0,0,1);
		Bi2Rwing(0,0,0,0,0,1);
		}
		if ( groupselector == 7 ) {# Gr.5
		Bi2Lnacelle(0,0,0,0,1,0);
		Bi2Lwing(0,0,0,0,1,0);
		Bi2Rnacelle(0,0,0,0,1,0);
		Bi2Rwing(0,0,0,0,1,0);
		}
		if ( groupselector == 8 ) {# Gr.4
		Bi2Lnacelle(0,0,0,1,0,0);
		Bi2Lwing(0,0,0,1,0,0);
		Bi2Rnacelle(0,0,0,1,0,0);
		Bi2Rwing(0,0,0,1,0,0);
		}
		if ( groupselector == 9 ) {# Gr.3
		Bi2Lnacelle(0,0,1,0,0,0);
		Bi2Lwing(0,0,1,0,0,0);
		Bi2Rnacelle(0,0,1,0,0,0);
		Bi2Rwing(0,0,1,0,0,0);
		}
		if ( groupselector == 10 ) {# Gr.2
		Bi2Lnacelle(0,1,0,0,0,0);
		Bi2Lwing(0,1,0,0,0,0);
		Bi2Rnacelle(0,1,0,0,0,0);
		Bi2Rwing(0,1,0,0,0,0);
		}
		if ( groupselector == 11 ) {# Gr.1
		var Bi2Lnacelle = 1 ;
		var Bi2Lwing = 1 ;
		var Bi2Rnacelle = 1 ;
		var Bi2Rwing = 1 ;
		Bi2(Bi2Lnacelle,Bi2Lwing,Bi2Rnacelle,Bi2Rwing,1,0,0,0,0,0);
#		Bi2Lwing(1,0,0,0,0,0);
#		Bi2Rnacelle(1,0,0,0,0,0);
#		Bi2Rwing(1,0,0,0,0,0);
		}
	}
}

var Bi2Lnacelle = func (Gr1,Gr2,Gr3,Gr4,Gr5,Gr6) {
	var current_from = getprop("an24/Fire-Protection/Sensors/current_from");
	var BI2L_Nacelle_Gr1 = getprop("an24/Fire-Protection/Sensors/NacelleL_Gr1") + Gr1;
	var BI2L_Nacelle_Gr2 = getprop("an24/Fire-Protection/Sensors/NacelleL_Gr2") + Gr2;
	var BI2L_Nacelle_Gr3 = getprop("an24/Fire-Protection/Sensors/NacelleL_Gr3") + Gr3;
	var BI2L_Nacelle_Gr4 = getprop("an24/Fire-Protection/Sensors/NacelleL_Gr4") + Gr4;
	var BI2L_Nacelle_Gr5 = getprop("an24/Fire-Protection/Sensors/NacelleL_Gr5") + Gr5;
	var BI2L_Nacelle_Gr6 = getprop("an24/Fire-Protection/Sensors/NacelleL_Gr6") + Gr6;

	if ( current_from == 0 ) {
		if ( BI2L_Nacelle_Gr1 >= 1.0 or BI2L_Nacelle_Gr2 >= 1.0 or BI2L_Nacelle_Gr3 >= 1.0 ) {
		var BI2L_Nacelle_term3 = 1 ;
		}
		else if ( BI2L_Nacelle_Gr1 < 1.0 and BI2L_Nacelle_Gr2 < 1.0 and BI2L_Nacelle_Gr3 < 1.0) {
		var BI2L_Nacelle_term3 = 0 ;
		}

		if ( BI2L_Nacelle_Gr4 >= 1.0 or BI2L_Nacelle_Gr5 >= 1.0 or BI2L_Nacelle_Gr6 >= 1.0) {
		var BI2L_Nacelle_term4 = 1 ;
		}
		else if ( BI2L_Nacelle_Gr4 < 1.0 and BI2L_Nacelle_Gr5 < 1.0 and BI2L_Nacelle_Gr6 < 1.0) {
		var BI2L_Nacelle_term4 = 0 ;
		}
	}
	else if ( current_from == 1 ) {
		if (BI2L_Nacelle_Gr1 >= 1.0 and BI2L_Nacelle_Gr2 >= 1.0 and BI2L_Nacelle_Gr3 >= 1.0) {
		var BI2L_Nacelle_term3 = 1 ;
		}
		else if ( BI2L_Nacelle_Gr1 < 1.0 or BI2L_Nacelle_Gr2 < 1.0 or BI2L_Nacelle_Gr3 < 1.0) {
		var BI2L_Nacelle_term3 = 0 ;
		}

		if ( BI2L_Nacelle_Gr4 >= 1.0 and BI2L_Nacelle_Gr5 >= 1.0 and BI2L_Nacelle_Gr6 >= 1.0) {
		var BI2L_Nacelle_term4 = 1 ;
		}
		else if ( BI2L_Nacelle_Gr4 < 1.0 or BI2L_Nacelle_Gr5 < 1.0 or BI2L_Nacelle_Gr6 < 1.0) {
		var BI2L_Nacelle_term4 = 0 ;
		}
	}
	setprop("an24/Fire-Protection/Sensors/Bi-2Lnacelle_term3", BI2L_Nacelle_term3 );
	setprop("an24/Fire-Protection/Sensors/Bi-2Lnacelle_term4", BI2L_Nacelle_term4 );

	setprop("an24/Fire-Protection/Rel1191", BI2L_Nacelle_term4 );
	setprop("an24/Fire-Protection/Rel864", BI2L_Nacelle_term3 );
}

var Bi2Lwing = func (Gr1,Gr2,Gr3,Gr4,Gr5,Gr6) {
	var BI2L_Wing_Gr1 = getprop("an24/Fire-Protection/Sensors/WingL_Gr1") + Gr1;
	var BI2L_Wing_Gr2 = getprop("an24/Fire-Protection/Sensors/WingL_Gr2") + Gr2;
	var BI2L_Wing_Gr3 = getprop("an24/Fire-Protection/Sensors/WingL_Gr3") + Gr3;
	var BI2L_Wing_Gr4 = getprop("an24/Fire-Protection/Sensors/WingL_Gr4") + Gr4;
	var BI2L_Wing_Gr5 = getprop("an24/Fire-Protection/Sensors/WingL_Gr5") + Gr5;
	var BI2L_Wing_Gr6 = getprop("an24/Fire-Protection/Sensors/WingL_Gr6") + Gr6;
	var current_from = getprop("an24/Fire-Protection/Sensors/current_from");

	if ( current_from == 0 ) {
		if ( BI2L_Wing_Gr1 >= 1.0 or BI2L_Wing_Gr2 >= 1.0 or BI2L_Wing_Gr3 >= 1.0) {
		var BI2L_Wing_term3 = 1 ;
		}
		else if ( BI2L_Wing_Gr1 < 1.0 and BI2L_Wing_Gr2 < 1.0 and BI2L_Wing_Gr3 < 1.0) {
		var BI2L_Wing_term3 = 0 ;
		}
		if ( BI2L_Wing_Gr4 >= 1.0 or BI2L_Wing_Gr5 >= 1.0 or BI2L_Wing_Gr6 >= 1.0) {
		var BI2L_Wing_term4 = 1 ;
		}
		else if ( BI2L_Wing_Gr4 < 1.0 and BI2L_Wing_Gr5 < 1.0 and BI2L_Wing_Gr6 < 1.0) {
		var BI2L_Wing_term4 = 0 ;
		}
	}
	else if ( current_from == 1 ) {
		if ( BI2L_Wing_Gr1 >= 1.0 and BI2L_Wing_Gr2 >= 1.0 and BI2L_Wing_Gr3 >= 1.0) {
		var BI2L_Wing_term3 = 1 ;
		}
		else if ( BI2L_Wing_Gr1 < 1.0 or BI2L_Wing_Gr2 < 1.0 or BI2L_Wing_Gr3 < 1.0) {
		var BI2L_Wing_term3 = 0 ;
		}
		if ( BI2L_Wing_Gr4 >= 1.0 and BI2L_Wing_Gr5 >= 1.0 and BI2L_Wing_Gr6 >= 1.0) {
		var BI2L_Wing_term4 = 1 ;
		}
		else if ( BI2L_Wing_Gr4 < 1.0 or BI2L_Wing_Gr5 < 1.0 or BI2L_Wing_Gr6 < 1.0) {
		var BI2L_Wing_term4 = 0 ;
		}
	}
	setprop("an24/Fire-Protection/Sensors/Bi-2Lwing_term3", BI2L_Wing_term3 );
	setprop("an24/Fire-Protection/Sensors/Bi-2Lwing_term4", BI2L_Wing_term4 );

	setprop("an24/Fire-Protection/Rel1191", BI2L_Wing_term3 );
	setprop("an24/Fire-Protection/Rel864", BI2L_Wing_term4 );
}

var Bi2Rnacelle = func (Gr1,Gr2,Gr3,Gr4,Gr5,Gr6) {
	var BI2R_Nacelle_Gr1 = getprop("an24/Fire-Protection/Sensors/NacelleR_Gr1") + Gr1;
	var BI2R_Nacelle_Gr2 = getprop("an24/Fire-Protection/Sensors/NacelleR_Gr2") + Gr2;
	var BI2R_Nacelle_Gr3 = getprop("an24/Fire-Protection/Sensors/NacelleR_Gr3") + Gr3;
	var BI2R_Nacelle_Gr4 = getprop("an24/Fire-Protection/Sensors/NacelleR_Gr4") + Gr4;
	var BI2R_Nacelle_Gr5 = getprop("an24/Fire-Protection/Sensors/NacelleR_Gr5") + Gr5;
	var BI2R_Nacelle_Gr6 = getprop("an24/Fire-Protection/Sensors/NacelleR_Gr6") + Gr6;
	var current_from = getprop("an24/Fire-Protection/Sensors/current_from");

	if ( current_from == 0 ) {
		if ( BI2R_Nacelle_Gr1 >= 1.0 or BI2R_Nacelle_Gr2 >= 1.0 or BI2R_Nacelle_Gr3 >= 1.0) {
		var BI2R_Nacelle_term3 = 1 ;
		}
		else if ( BI2R_Nacelle_Gr1 < 1.0 and BI2R_Nacelle_Gr2 < 1.0 and BI2R_Nacelle_Gr3 < 1.0) {
		var BI2R_Nacelle_term3 = 0 ;
		}

		if ( BI2R_Nacelle_Gr4 >= 1.0 or BI2R_Nacelle_Gr5 >= 1.0 or BI2R_Nacelle_Gr6 >= 1.0) {
		var BI2R_Nacelle_term4 = 1 ;
		}
		else if ( BI2R_Nacelle_Gr4 < 1.0 and BI2R_Nacelle_Gr5 < 1.0 and BI2R_Nacelle_Gr6 < 1.0) {
		var BI2R_Nacelle_term4 = 0 ;
		}
	}
	else if ( current_from == 1 ) {
		if ( BI2R_Nacelle_Gr1 >= 1.0 and BI2R_Nacelle_Gr2 >= 1.0 and BI2R_Nacelle_Gr3 >= 1.0) {
		var BI2R_Nacelle_term3 = 1 ;
		}
		else if ( BI2R_Nacelle_Gr1 < 1.0 or BI2R_Nacelle_Gr2 < 1.0 or BI2R_Nacelle_Gr3 < 1.0) {
		var BI2R_Nacelle_term3 = 0 ;
		}

		if ( BI2R_Nacelle_Gr4 >= 1.0 and BI2R_Nacelle_Gr5 >= 1.0 and BI2R_Nacelle_Gr6 >= 1.0) {
		var BI2R_Nacelle_term4 = 1 ;
		}
		else if ( BI2R_Nacelle_Gr4 < 1.0 or BI2R_Nacelle_Gr5 < 1.0 or BI2R_Nacelle_Gr6 < 1.0) {
		var BI2R_Nacelle_term4 = 0 ;
		}
	}
	setprop("an24/Fire-Protection/Sensors/Bi-2Rnacelle_term3", BI2R_Nacelle_term3 );
	setprop("an24/Fire-Protection/Sensors/Bi-2Rnacelle_term4", BI2R_Nacelle_term4 );

	setprop("an24/Fire-Protection/Rel1189", BI2R_Nacelle_term3 );
	setprop("an24/Fire-Protection/Rel867", BI2R_Nacelle_term4 );
}

var Bi2Rwing = func (Gr1,Gr2,Gr3,Gr4,Gr5,Gr6) {
	var BI2R_Wing_Gr1 = getprop("an24/Fire-Protection/Sensors/WingR_Gr1") + Gr1;
	var BI2R_Wing_Gr2 = getprop("an24/Fire-Protection/Sensors/WingR_Gr2") + Gr2;
	var BI2R_Wing_Gr3 = getprop("an24/Fire-Protection/Sensors/WingR_Gr3") + Gr3;
	var BI2R_Wing_Gr4 = getprop("an24/Fire-Protection/Sensors/WingR_Gr4") + Gr4;
	var BI2R_Wing_Gr5 = getprop("an24/Fire-Protection/Sensors/WingR_Gr5") + Gr5;
	var BI2R_Wing_Gr6 = getprop("an24/Fire-Protection/Sensors/WingR_Gr6") + Gr6;
	var current_from = getprop("an24/Fire-Protection/Sensors/current_from");

	if ( current_from == 0 ) {
		if ( BI2R_Wing_Gr1 >= 1.0 or BI2R_Wing_Gr2 >= 1.0 or BI2R_Wing_Gr3 >= 1.0) {
		var BI2R_Wing_term3 = 1 ;
		}
		else if ( BI2R_Wing_Gr1 < 1.0 and BI2R_Wing_Gr2 < 1.0 and BI2R_Wing_Gr3 < 1.0) {
		var BI2R_Wing_term3 = 0 ;
		}

		if ( BI2R_Wing_Gr4 >= 1.0 or BI2R_Wing_Gr5 >= 1.0 or BI2R_Wing_Gr6 >= 1.0) {
		var BI2R_Wing_term4 = 1 ;
		}
		else if ( BI2R_Wing_Gr4 < 1.0 and BI2R_Wing_Gr5 < 1.0 and BI2R_Wing_Gr6 < 1.0) {
		var BI2R_Wing_term4 = 0 ;
		}
	}
	if ( current_from == 1 ) {
		if ( BI2R_Wing_Gr1 >= 1.0 and BI2R_Wing_Gr2 >= 1.0 and BI2R_Wing_Gr3 >= 1.0) {
		var BI2R_Wing_term3 = 1 ;
		}
		else if ( BI2R_Wing_Gr1 < 1.0 or BI2R_Wing_Gr2 < 1.0 or BI2R_Wing_Gr3 < 1.0) {
		var BI2R_Wing_term3 = 0 ;
		}

		if ( BI2R_Wing_Gr4 >= 1.0 and BI2R_Wing_Gr5 >= 1.0 and BI2R_Wing_Gr6 >= 1.0) {
		var BI2R_Wing_term4 = 1 ;
		}
		else {
		var BI2R_Wing_term4 = 0 ;
		}
	}
	setprop("an24/Fire-Protection/Sensors/Bi-2Rwing_term3", BI2R_Wing_term3 );
	setprop("an24/Fire-Protection/Sensors/Bi-2Rwing_term4", BI2R_Wing_term4 );

	setprop("an24/Fire-Protection/Rel1189", BI2R_Wing_term4 );
	setprop("an24/Fire-Protection/Rel867", BI2R_Wing_term3 );
}

var Bi7engines = func (DTB1,DTB2,DTB3,DTB4) {
	var BI7_DTB1 = getprop("an24/Fire-Protection/Sensors/DTB_1") + DTB1;
	var BI7_DTB2 = getprop("an24/Fire-Protection/Sensors/DTB_2") + DTB2;
	var BI7_DTB3 = getprop("an24/Fire-Protection/Sensors/DTB_3") + DTB3;
	var BI7_DTB4 = getprop("an24/Fire-Protection/Sensors/DTB_4") + DTB4;
	if ( BI7_DTB1 >= 1.0 or BI7_DTB2 >= 1.0 ) {
	var BI7_term4 = 1 ;
	}
	else if ( BI7_DTB1 < 1.0 and BI7_DTB2 < 1.0)  {
	var BI7_term4 = 0 ;
	}

	if ( BI7_DTB3 >= 1.0 or BI7_DTB4 >= 1.0 ) {
	var BI7_term3 = 1 ;
	}
	else if ( BI7_DTB3 < 1.0 and BI7_DTB4 < 1.0)  {
	var BI7_term3 = 0 ;
	}
	setprop("an24/Fire-Protection/Sensors/Bi-7_term3", BI7_term3 );
	setprop("an24/Fire-Protection/Sensors/Bi-7_term4", BI7_term4 );
}

var Relais = func {
# Fire in left wing
	if ( getprop("an24/Fire-Protection/Sensors/Bi-2Lwing_term3") == 1 or getprop("an24/Fire-Protection/Sensors/Bi-2Lnacelle_term4") == 1 ) {
	var Rel1191 = 1 ;
	}
	else {
	var Rel1191 = 0 ;
	}
# Fire in left nacelle
	if ( getprop("an24/Fire-Protection/Sensors/Bi-2Lwing_term4") == 1 or getprop("an24/Fire-Protection/Sensors/Bi-2Lnacelle_term3") == 1 ) {
	var Rel864 = 1 ;
	}
	else {
	var Rel864 = 0 ;
	}
# Fire in right nacelle
	if ( getprop("an24/Fire-Protection/Sensors/Bi-2Rwing_term3") == 1 or getprop("an24/Fire-Protection/Sensors/Bi-2Rnacelle_term4") == 1 ) {
	var Rel867 = 1 ;
	}
	else {
	var Rel867 = 0 ;
	}
# Fire in right wing
	if ( getprop("an24/Fire-Protection/Sensors/Bi-2Rwing_term4") == 1 or getprop("an24/Fire-Protection/Sensors/Bi-2Rnacelle_term3") == 1 ) {
	var Rel1189 = 1 ;
	}
	else {
	var Rel1189 = 0 ;
	}
	setprop("an24/Fire-Protection/Rel1191", Rel1191 );
	setprop("an24/Fire-Protection/Rel864", Rel864 );
	setprop("an24/Fire-Protection/Rel1189", Rel1189 );
	setprop("an24/Fire-Protection/Rel867", Rel867 );
}

var FireSiren = func {
	var powerLeft = getprop("an24/Fire-Protection/power-left");
	var powerRight = getprop("an24/Fire-Protection/power-right");
	var SirenRel1191 = getprop("an24/Fire-Protection/Rel1191");
	var SirenRel864 = getprop("an24/Fire-Protection/Rel864");
	var SirenRel1189 = getprop("an24/Fire-Protection/Rel1189");
	var SirenRel867 = getprop("an24/Fire-Protection/Rel867");
	if ( (powerLeft == 1.0 and ( SirenRel1191 == 1 or SirenRel864 == 1 )) or (powerRight == 1.0 and ( SirenRel1189 == 1 or SirenRel867 == 1 )) ) {
	setprop("an24/Siren/constant", 1 );
	}
	else {
	setprop("an24/Siren/constant", 0 );
	}
}
 setlistener("an24/Fire-Protection/power-left", FireSiren, 0, 0);
 setlistener("an24/Fire-Protection/power-right", FireSiren, 0, 0);
 setlistener("an24/Fire-Protection/Rel1191", FireSiren, 0, 0);
 setlistener("an24/Fire-Protection/Rel864", FireSiren, 0, 0);
 setlistener("an24/Fire-Protection/Rel1189", FireSiren, 0, 0);
 setlistener("an24/Fire-Protection/Rel867", FireSiren, 0, 0);
# setlistener("an24/Fire-Protection/Sensors/Bi-2Lnacelle_term3", Relais1191, 0, 0);
# setlistener("an24/Fire-Protection/Sensors/Bi-2Lnacelle_term4", Relais1191, 0, 0);
# setlistener("an24/Fire-Protection/Sensors/Bi-2Lwing_term3", Relais1191, 0, 0);
# setlistener("an24/Fire-Protection/Sensors/Bi-2Lwing_term4", Relais1191, 0, 0);

# setlistener("an24/Fire-Protection/Sensors/Bi-2Rnacelle_term3", Relais1191, 0, 0);
# setlistener("an24/Fire-Protection/Sensors/Bi-2Rnacelle_term4", Relais1191, 0, 0);
# setlistener("an24/Fire-Protection/Sensors/Bi-2Rwing_term3", Relais1191, 0, 0);
# setlistener("an24/Fire-Protection/Sensors/Bi-2Rwing_term4", Relais1191, 0, 0);


# setlistener("an24/Fire-Protection/Sensors/Bi-7_term3", Relais1191, 0, 0);
# setlistener("an24/Fire-Protection/Sensors/Bi-7_term4", Relais1191, 0, 0);

# setlistener("an24/Fire-Protection/Sensors/Bi-2Lnacelle_term3", FireSignaling, 0, 0);
# setlistener("an24/Fire-Protection/Sensors/Bi-2Lnacelle_term4", FireSignaling, 0, 0);
# setlistener("an24/Fire-Protection/Sensors/Bi-2Lwing_term3", FireSignaling, 0, 0);
# setlistener("an24/Fire-Protection/Sensors/Bi-2Lwing_term4", FireSignaling, 0, 0);

# setlistener("an24/Fire-Protection/Sensors/Bi-2Rnacelle_term3", FireSignaling, 0, 0);
# setlistener("an24/Fire-Protection/Sensors/Bi-2Rnacelle_term4", FireSignaling, 0, 0);
# setlistener("an24/Fire-Protection/Sensors/Bi-2Rwing_term3", FireSignaling, 0, 0);
# setlistener("an24/Fire-Protection/Sensors/Bi-2Rwing_term4", FireSignaling, 0, 0);

# setlistener("an24/Fire-Protection/Sensors/Bi-7_term3", FireSignaling, 0, 0);
# setlistener("an24/Fire-Protection/Sensors/Bi-7_term4", FireSignaling, 0, 0);


