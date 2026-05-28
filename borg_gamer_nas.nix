{ config, pkgs, ... }:
{

    # borg gamer 
    #----------------------------------------

    systemd.timers."borg_gamer_nas" = {
	wantedBy = [ "timers.target" ];
	timerConfig = {
	    OnCalendar= "*-*-* 04:00:00";
	    Persistent = "true";
	    Unit = "borg_gamer_nas.service";
	};
    };

    systemd.services."borg_gamer_nas" = {
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
	    bash /home/petra/bin/backup_nas.sh
	    '';
    };

}
