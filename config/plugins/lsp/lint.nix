{pkgs, ...}: {
  plugins.lint = {
    enable = true;

    lintersByFt = {
      javascript = ["eslint_d"];
      php = ["phpcs" "phpstan"];
    };
  };

  extraPlugins = with pkgs.vimPlugins; [
    php82Packages.phpstan
    php82Packages.php-codesniffer
    statix # Nix code linter
    selene # Lua linter and formatter
    eslint_d # Linting utility for JavaScript
    nodePackages.jsonlint
    checkstyle # Static code analysis for Java
  ];
}
