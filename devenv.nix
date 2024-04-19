{ pkgs, lib, config, inputs, ... }:

{
  env.GREET = "devenv";

  packages = [
    pkgs.git
    pkgs.elixir
    pkgs.erlang
    pkgs.postgresql_16
    pkgs.inotify-tools
  ];

  scripts.hello.exec = ''
    echo
    echo "Starting blogx development environment"
    echo
  '';

  scripts.dev.exec = ''
    if ! psql -l | grep -q "blog-db"; then mix setup; fi
    mix phx.server
  '';

  scripts.c.exec = ''
    iex -S mix
  '';

  scripts.up.exec = ''
    devenv up
  '';

  enterShell = ''
    hello
    elixir -v
  '';

  services.postgres = {
    enable = true;
    port = 5500;
    package = pkgs.postgresql_16;
    initialScript = ''
      CREATE USER postgres WITH PASSWORD 'postgres' SUPERUSER;
    '';
  };

  enterTest = ''
    echo "Running tests"
    elixir -v | grep "25"
    elixir -v | grep "1.16"
  '';
}
