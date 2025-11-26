#####################################################
# Feather Pumps NF
#####################################################
var FeatheringTimerL = func {
	var FeatherCommandL = getprop("fdm/jsbsim/fcs/prop-governor[0]/feather-command");
		if (FeatherCommandL > 0.0) {
		interpolate("/an24/FireFeather/feather-timer_l", 6.0, 0.2, 6.0, 12.0, 0.0, 0.4 );
		}
}
 setlistener("fdm/jsbsim/fcs/prop-governor[0]/feather-command", FeatheringTimerL, 0, 0 );

var FeatheringTimerR = func {
	var FeatherCommandR = getprop("fdm/jsbsim/fcs/prop-governor[1]/feather-command");
		if (FeatherCommandR > 0.0) {
		interpolate("/an24/FireFeather/feather-timer_r", 6.0, 0.2, 6.0, 12.0, 0.0, 0.4 );
		}
}
# setlistener("fdm/jsbsim/fcs/prop-governor[1]/feather-command", FeatheringTimerR, 0, 0 );
