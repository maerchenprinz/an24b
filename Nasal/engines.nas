#####################################################
# APD-27 gives a fixed AI-24 start sequence
#####################################################
var apdtimer = maketimer(1, func(){
	var speedup = getprop("/sim/speed-up");
	var apdtime = getprop("an24/Electrics/StartCircuit/apdtime");
	var apdtime = apdtime + speedup ;
	setprop("an24/Electrics/StartCircuit/apdtime", int(apdtime));
});

var apdsequence = func(selengine) {
	var RK_Nacelle_V = getprop("an24/Electrics/RK_Nacelle_V") ;
	var selengine = str(getprop("an24/Start-Panel/sw_left-right")) ;
	var BoardAero = getprop("an24/Electrical_Panel/sw_board-aerodrome") ;
##### Check for prerequisites
	if ( BoardAero == 1.0 ) {
		if ( RK_Nacelle_V > 24.0 ) {
		setprop("an24/Electrics/StartCircuit/StartCircuit_fedby", "GS-24");
		setprop("an24/Electrics/StartCircuit/StartCircuit_V", RK_Nacelle_V ) ;
		}
		else {
		apdtimer.stop();
		setprop("an24/Electrics/StartCircuit/apdtime", 0 );
		setprop("an24/Electrics/StartCircuit/StartCircuit_fedby", "NO_GS-24");
		setprop("an24/Electrics/StartCircuit/StartCircuit_V", 0.0 ) ;
		}
	}
	else if ( BoardAero == -1.0 ) {
		var Aerodrome1 = getprop("an24/Electrics/DC_AUX_ShRAP500a_V") ;
		var Aerodrome2 = getprop("an24/Electrics/DC_AUX_ShRAP500b_V") ;
		if ( RK_Nacelle_V > 24.0 and Aerodrome1 > 0.0 and Aerodrome2 > 0.0 ) {
		setprop("an24/Electrics/StartCircuit/StartCircuit_fedby", "AERODROME");
		setprop("an24/Electrics/StartCircuit/StartCircuit_V", RK_Nacelle_V ) ;
		}
		else {
		apdtimer.stop();
		setprop("an24/Electrics/StartCircuit/apdtime", 0 );
		setprop("an24/Electrics/StartCircuit/StartCircuit_fedby", "NO_AERO");
		setprop("an24/Electrics/StartCircuit/StartCircuit_V", 0.0 ) ;
		}
	}
	else {
	apdtimer.stop();
	setprop("an24/Electrics/StartCircuit/apdtime", 0 );
	setprop("an24/Electrics/StartCircuit/StartCircuit_fedby", "NONE");
	}
##### Start sequence itself
if ( getprop("engines/engine[" ~ selengine ~ "]/rpm") < 600 ) {
	if ( getprop("an24/Electrics/StartCircuit/apdtime") == 1 ) { # 0s
	screen.log.write("Ignition ON, Stop Valve ACTIVE, STG-18 Terminals 3-7V", 1, 1, 1);
	setprop("an24/Electrics/StartCircuit/STG-18_terminal_V", 7.0);
	setprop("controls/electric/engine[" ~ selengine ~ "]/generator", 1);
	setprop("controls/engines/engine[" ~ selengine ~ "]/starter", 1);
	}

	if ( getprop("an24/Electrics/StartCircuit/apdtime") == 4 ) { # 3s
	screen.log.write("Terminals 16-21V", 1, 1, 1);
	setprop("an24/Electrics/StartCircuit/STG-18_terminal_V", 21.0);
	}

	if ( getprop("an24/Electrics/StartCircuit/apdtime") == 10 ) { # 9s
	screen.log.write("Power Regulation ON, Fuel to Start Fuel Injectors", 1, 1, 1);
	}
	if ( getprop("an24/Electrics/StartCircuit/apdtime") == 16 ) { # 15s
	screen.log.write("Power Regulation OFF, Sources from parallel to series -> Terminals 35-48V", 1, 1, 1);
	setprop("an24/Electrics/StartCircuit/STG-18_terminal_V", 48.0);
	}

	if ( getprop("an24/Electrics/StartCircuit/apdtime") == 21 ) { # 20s
	screen.log.write("Power Regulation ON again, Fuel to Working Fuel Injectors", 1, 1, 1);
	}
	if ( getprop("an24/Electrics/StartCircuit/apdtime") == 29 ) { # 28s
	screen.log.write("Ignition OFF, Stop Valve INACTIVE", 1, 1, 1);
	}
	if ( getprop("an24/Electrics/StartCircuit/apdtime") == 70 ) { # 69s
	screen.log.write("Disconnect STG-18 from Start Circuit", 1, 1, 1);
	setprop("an24/Electrics/StartCircuit/STG-18_terminal_V", 0.0);
	apdtimer.stop();
	setprop("controls/electric/engine[" ~ selengine ~ "]/generator", 0 );
	setprop("controls/engines/engine[" ~ selengine ~ "]/starter", 0);
	setprop("an24/Electrics/StartCircuit/apdtime", 0 );
	setprop("an24/Electrics/StartCircuit/STG-18_terminal_V", 0.0);
	}
}
else {
	apdtimer.stop();
	setprop("controls/electric/engine["~selengine~"]/generator", 0);
	setprop("controls/engines/engine["~selengine~"]/starter", 0);
	setprop("an24/Electrics/StartCircuit/apdtime", 0 );
	setprop("an24/Electrics/StartCircuit/STG-18_terminal_V", 7.0);
	}
}
 setlistener("an24/Electrics/StartCircuit/apdtime", apdsequence, 0, 0 );

var apdannounce = func {
	var fedby = getprop("an24/Electrics/StartCircuit/StartCircuit_fedby") ;
	if ( fedby == 'GS-24' ) {
	screen.log.write("GS-24 feeds Start Circuit", 0, 1, 0);
	}
	if ( fedby == 'AERODROME' ) {
	screen.log.write("Aerodrome Power on Start Circuit", 0, 1, 0);
	}
	if ( fedby == 'NO_GS-24' ) {
	screen.log.write("Generator GS-24 not on Start Circuit!", 1, 0, 0);
	}
	if ( fedby == 'NO_AERO' ) {
	screen.log.write("No Aerodrome Power Source connected!", 1, 0, 0);
	}
	else if ( fedby == 'NONE' ) {
	screen.log.write("No power on Start Circuit! Choose either Board or Aerodrome!", 1, 0, 0);
	}
}
 setlistener("an24/Electrics/StartCircuit/StartCircuit_fedby", apdannounce, 0, 0);

#####################################################
# Gasturbine GS-24 of GTD-16 start
#####################################################
var gt16_startseq = maketimer(1, func() {
	var gt16n2 = getprop("engines/engine[2]/n2");
	var cutoff = getprop("an24/FuelControl/TG-16_cutoff");
	if ( getprop("an24/Start-Panel/tg-cold-start") == 0.0 ) {
	setprop("/fdm/jsbsim/propulsion/cutoff_cmd", 0.0);
	setprop("/controls/engines/engine[2]/cutoff", 1.0);
	setprop("/controls/engines/engine[2]/starter", 1.0 );
		if (gt16n2 > 24.0 and cutoff == 0.0 ) {
		setprop("/fdm/jsbsim/propulsion/cutoff_cmd", 0.0);
		setprop("/controls/engines/engine[2]/cutoff", 0.0);
		setprop("/controls/engines/engine[2]/throttle", 0.9);
		}
	}
	else {
	setprop("/controls/engines/engine[2]/cutoff", 1.0);
	setprop("/controls/engines/engine[2]/starter", 1.0 );
	settimer(func {setprop("/controls/engines/engine[2]/starter", 0.0 );}, 10.0 );
	}
});

#####################################################
# WATER INJECTION
#####################################################
var WaterLevel = func() {
	var WaterInjPower = getprop("an24/WaterInjection/power_27V");
	var WaterInjTestSw = getprop("an24/WaterInjection/sw_test_tanks");
	var LevelLeft = getprop("/fdm/jsbsim/inertia/pointmass-weight-lbs[3]");
	var LevelRight = getprop("/fdm/jsbsim/inertia/pointmass-weight-lbs[4]");
	if ( WaterInjPower == 1 and WaterInjTestSw == 1.0) {
		if ( LevelLeft > 55.0 ) {
		setprop("an24/WaterInjection/sl_left_full", 1);
		setprop("an24/WaterInjection/sl_left_empty", 0);
		}
		else {
		setprop("an24/WaterInjection/sl_left_full", 0);
		setprop("an24/WaterInjection/sl_left_empty", 1);
		}
		if ( LevelRight > 55.0 ) {
		setprop("an24/WaterInjection/sl_right_full", 1);
		setprop("an24/WaterInjection/sl_right_empty", 0);
		}
		else {
		setprop("an24/WaterInjection/sl_right_full", 0);
		setprop("an24/WaterInjection/sl_right_empty", 1);
		}
	}
	else {
	setprop("an24/WaterInjection/sl_left_full", 0);
	setprop("an24/WaterInjection/sl_left_empty", 0);
	setprop("an24/WaterInjection/sl_right_full", 0);
	setprop("an24/WaterInjection/sl_right_empty", 0);
	}
}
 setlistener("an24/WaterInjection/power_27V", WaterLevel, 0, 0 );
 setlistener("an24/WaterInjection/sw_test_tanks", WaterLevel, 0, 0 );
# tied property! setlistener("/fdm/jsbsim/inertia/pointmass-weight-lbs[3]", WaterLevel, 0, 0 );
# tied property! setlistener("/fdm/jsbsim/inertia/pointmass-weight-lbs[4]", WaterLevel, 0, 0 );

var WIValveLeft = maketimer(0.4, func(){
	var WIValveDirectionL = getprop("an24/WaterInjection/sw_triggerL");
	var WaterInjPowerL = getprop("an24/WaterInjection/power_27V") ;
	var WaterInjValveL = getprop("an24/WaterInjection/ValveL");
	if ( WaterInjPowerL == 1 ) {
		if ( (WIValveDirectionL == -1 and WaterInjValveL > 0.0) or (WIValveDirectionL == 1 and WaterInjValveL < 1.0) ) {
		var WaterInjValveL = WaterInjValveL + (0.1*WIValveDirectionL) ;
		}
		else {
		WIValveLeft.stop();
		}
	}
	else {
	WIValveLeft.stop();
	}
	if ( WaterInjValveL < 0.1 ) {
	var WaterInjValveL = 0.0 ;
	}
	else if ( WaterInjValveL > 0.9 ) {
	var WaterInjValveL = 1.0 ;
	}
	setprop( "an24/WaterInjection/ValveL", WaterInjValveL );
});

var WIValveRight = maketimer(0.4, func(){
	var WIValveDirectionR = getprop("an24/WaterInjection/sw_triggerR");
	var WaterInjPowerR = getprop("an24/WaterInjection/power_27V") ;
	var WaterInjValveR = getprop("an24/WaterInjection/ValveR");
	if ( WaterInjPowerR == 1 ) {
		if ( (WIValveDirectionR == -1 and WaterInjValveR > 0.0) or (WIValveDirectionR == 1 and WaterInjValveR < 1.0) ) {
		var WaterInjValveR = WaterInjValveR + (0.1*WIValveDirectionR) ;
		}
		else {
		WIValveRight.stop();
		}
	}
	else {
	WIValveRight.stop();
	}
	if ( WaterInjValveR < 0.1 ) {
	var WaterInjValveR = 0.0 ;
	}
	else if ( WaterInjValveR > 0.9 ) {
	var WaterInjValveR = 1.0 ;
	}
	setprop( "an24/WaterInjection/ValveR", WaterInjValveR );
});
