class SimplyprintClient < Formula
  desc "SimplyPrint Client"
  homepage "https://simplyprint.io"
  version "1.0.0-rc.4"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://download.simplyprint.io/client/ota/production/targets/stable/simplyprint-client/app/simplyprint-client-1.0.0-rc.4-macos-arm64.tar.gz"
      sha256 "5417b6f90e203dec40d17dd0cca5f1c557a154223dd02914fe4d842a40cfc566"
    end

    on_intel do
      url "https://download.simplyprint.io/client/ota/production/targets/stable/simplyprint-client/app/simplyprint-client-1.0.0-rc.4-macos-x86_64.tar.gz"
      sha256 "71451c6eeb30fe0f4155209a339f2c467b2f7f0b5b4c80743fa8726cf9b8950c"
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
    keep_alive successful_exit: false
    environment_variables(
      PATH: "#{HOMEBREW_PREFIX}/bin:/usr/bin:/bin:/usr/sbin:/sbin",
      SIMPLYPRINT_INSTALL_METHOD: "homebrew",
      SIMPLYPRINT_HOMEBREW_BREW: "#{HOMEBREW_PREFIX}/bin/brew",
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
