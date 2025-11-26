var help_winFlaps = screen.window.new();
help_winFlaps.fg = [1,1,1,1];
help_winFlaps.x = -20 ;
help_winFlaps.y = 20 ;
help_winFlaps.align = "right" ;
help_winFlaps.maxlines = 1 ;
help_winFlaps.autoscroll = 2 ;

var help_winDME1 = screen.window.new();
help_winDME1.fg = [1,1,1,1];
help_winDME1.bg = [0,0,0,1];
help_winDME1.x = 20 ;
help_winDME1.y = -20 ;
help_winDME1.align = "left" ;
help_winDME1.maxlines = 1 ;
help_winDME1.autoscroll = 3 ;

var help_winDME2 = screen.window.new();
help_winDME2.fg = [1,1,1,1];
help_winDME2.bg = [0,0,0,1];
help_winDME2.x = -20 ;
help_winDME2.y = -20 ;
help_winDME2.align = "left" ;
help_winDME2.maxlines = 1 ;
help_winDME2.autoscroll = 3 ;

var help_winIdleLock = screen.window.new();
help_winIdleLock.fg = [1,1,1,1];
help_winIdleLock.x = -20 ;
help_winIdleLock.y = 20 ;
help_winIdleLock.align = "right" ;
help_winIdleLock.maxlines = 1 ;
help_winIdleLock.autoscroll = 5 ;

var help_winRoll = screen.window.new();
help_winRoll.fg = [1,1,1,1];
help_winRoll.x = -20 ;
help_winRoll.y = 20 ;
help_winRoll.align = "right" ;
help_winRoll.maxlines = 1 ;
help_winRoll.autoscroll = 5 ;

var help_winMass = screen.window.new();
help_winMass.fg = [0,1,1,1];
help_winMass.x = 20 ;
help_winMass.y = 20 ;
help_winMass.align = "left" ;
help_winMass.maxlines = 1 ;
help_winMass.autoscroll = 10 ;

# Printing flaps position when in transit
var flaps = func {
   var flaps_pos_deg = getprop("/fdm/jsbsim/fcs/flap-pos-deg");
   if(  flaps_pos_deg == nil ) flaps_pos_deg = 0.0;
   help_winFlaps.write(sprintf("Flaps position: %.0f degrees", flaps_pos_deg) );
}
 setlistener( "surface-positions/flap-pos-norm", flaps, 0, 0 );

# Printing DME output
var dme1 = func {
	if ( getprop("fdm/jsbsim/fcs/realism/dme-enabled") == 1.0 ) {
	var dme1_dist_km = getprop("instrumentation/nav[0]/nav-distance")/1000;
	help_winDME1.write(sprintf("DME1 %.1f km", dme1_dist_km) );
	}
}
 setlistener( "instrumentation/nav[0]/nav-distance", dme1, 0, 0 );

var dme2 = func {
	if ( getprop("fdm/jsbsim/fcs/realism/dme-enabled") == 1.0 ) {
	var dme2_dist_km = getprop("instrumentation/nav[1]/nav-distance")/1000;
	help_winDME2.write(sprintf("DME2 %.1f km", dme2_dist_km) );
	}
}
 setlistener( "instrumentation/nav[1]/nav-distance", dme2, 0, 0 );

# Printing idle lock position when changing
var idle_lock = func {
   var idle_lock_pos = getprop("/controls/engines/idle-lock-pos");
   if(  idle_lock_pos == nil ) idle_lock_pos = 12;
   if ( idle_lock_pos < 12) idle_lock_pos = 12;
   if ( idle_lock_pos > 22) idle_lock_pos = 22;
   setprop("/controls/engines/idle-lock-pos", idle_lock_pos); 
   help_winIdleLock.write(sprintf("Idle lock: %.0f degrees UPRT", idle_lock_pos) );
}
 setlistener( "/controls/engines/idle-lock-pos", idle_lock, 0, 0 );

# Printing roll knob position
var KnobRollControl = func {
   var RollKnobpos = getprop("an24/AP-28l1/knob_roll-control");
   help_winRoll.write(sprintf("Roll Knob %.1f degrees", RollKnobpos) );
}
 setlistener( "an24/AP-28l1/knob_roll-control", KnobRollControl, 0, 0 );

# Help string with masses and speeds
var mass_info = func {
   var mass_lbs = getprop("/fdm/jsbsim/inertia/weight-lbs");
   var fuel_kg = getprop("/consumables/fuel/total-fuel-kg");
   var flaps_pos_deg = getprop("/fdm/jsbsim/fcs/flap-pos-deg");
   var cg_z_m = getprop("/fdm/jsbsim/inertia/cg-z-in") * 0.0254;
   var cg_x_m = getprop("/fdm/jsbsim/inertia/cg-x-in") * 0.0254;
   var nose_gear_pos = getprop("/gear/gear[0]/wow");

   var yt0 = 1.467 - cg_z_m - 0.0524 * (cg_x_m - 8.866);
   var xt0 = cg_x_m - 8.866 + 0.0524 * yt0;
   var cax = xt0 * 100 / 2.813;

   var mass_kg = mass_lbs * 0.45359237;

   var vrotate = 5.5 * mass_kg / 1000 - 1.5 * flaps_pos_deg + 117;
   if (mass_kg > 19000) {
      vref = 210;
   } else {
      vref = 200;
   }

   if (nose_gear_pos) {
      help_winMass.write(sprintf("Total mass: %.0f kg, CAX: %.1f%%, Total fuel: %.0f kg, Vr: %.0f km/h", mass_kg, cax, fuel_kg, vrotate) );
   } else {
      help_winMass.write(sprintf("Total mass: %.0f kg, CAX: %.1f%%, Total fuel: %.0f kg, Vref: %.0f km/h", mass_kg, cax, fuel_kg, vref) );
   }
}
