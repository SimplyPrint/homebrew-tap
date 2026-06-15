class SimplyprintClient < Formula
  desc "SimplyPrint Client"
  homepage "https://simplyprint.io"
  version "1.0.0-beta.113.dev.98.1.72643b807ac5"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://download.simplyprint.io/client/ota/development/targets/canary/simplyprint-client-1.0.0-beta.113.dev.98.1.72643b807ac5-macos-arm64.tar.gz"
      sha256 "a1441a8069485d214853fd7bcfbd82688612abc85190294e0af46bec960cfe16"
    end
  end

  def install
    bundle = buildpath
    nested = buildpath/"simplyprint-client"
    bundle = nested if (nested/"simplyprint-client").executable?

    libexec.install Dir["#{bundle}/*"]
    bin.install_symlink libexec/"simplyprint-client"
  end

  service do
    run [opt_bin/"simplyprint-client", "serve"]
    keep_alive true
    environment_variables(
      SIMPLYPRINT_INSTALL_METHOD: "homebrew",
      SIMPLYPRINT_HOMEBREW_FORMULA: "simplyprint/tap/simplyprint-client",
      SIMPLYPRINT_HOMEBREW_SERVICE: "simplyprint/tap/simplyprint-client",
    )
    log_path var/"log/simplyprint-client.log"
    error_log_path var/"log/simplyprint-client.error.log"
  end

  def caveats
    <<~EOS
      Start the SimplyPrint Client service with:
        brew services start simplyprint/tap/simplyprint-client

      The local web UI will be available at:
        http://localhost:8000

      Logs are written to:
        #{var}/log/simplyprint-client.log
        #{var}/log/simplyprint-client.error.log
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/simplyprint-client version")
  end
end
