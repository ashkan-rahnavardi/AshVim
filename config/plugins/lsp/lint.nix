{
  plugins.lint = {
    enable = true;

    lintersByFt = {
      javascript = ["eslint_d"];
      php = ["phpcs" "phpstan"];
    };
  };
}
