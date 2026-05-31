{ config, pkgs, lib, ... }:

{
  services.searx = {
    enable = true;
    package = pkgs.searxng;
    settings = {
      use_default_settings = true;
      server = {
        # server.secret_key = "my_strong_secret_key_18";
        bind_address = "127.0.0.1";
        port = 8888;
      };

      search.safe_search = 1;
      search.autocomplete = "duckduckgo";

    };
  };
}
