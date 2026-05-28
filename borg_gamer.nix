{ config, pkgs, ... }:
{

    # borg gamer 
    #----------------------------------------

    systemd.timers."borg_gamer" = {
	wantedBy = [ "timers.target" ];
	timerConfig = {
	    OnCalendar= "*-*-* 03:00:00";
	    Persistent = "true";
	    Unit = "borg_gamer.service";
	};
    };

    systemd.services."borg_gamer" = {
	serviceConfig = {
	    Type = "simple";
	    User = "petra";
	    WorkingDirectory = "/home/petra/bin";
	};
	path = with pkgs; [ 
	    bash
	    borgbackup
	];
	script = ''
	    bash /home/petra/bin/backup.sh
	    '';
    };

}
