{ pkgs, username, ... }:
{
  virtualisation.docker = {
    enable = true;
    rootless = {
      enable = true;
      setSocketVariable = true;
    };

    daemon = {
      settings = {
        data-root = "/opt/docker";
      };
    };
  
    
  };

  virtualisation.oci-containers = {
    backend = "docker";
    containers = {
      portainer = {
        image = "portainer/portainer-ce";
	autoStart = true;
	ports = [
	  "8000:8000"
	  "9443:9443"
	];
	volumes = [
          "/var/run/docker.sock:/var/run/docker.sock"
	  "portainer_data:/data"
	];
      };
    };
  };

  users.users.${username}.extraGroups = [ "docker" ];
}
