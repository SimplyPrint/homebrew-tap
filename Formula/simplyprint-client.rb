class SimplyprintClient < Formula
  desc "SimplyPrint Client"
  homepage "https://simplyprint.io"
  version "1.0.0-rc.4"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://download.simplyprint.io/client/ota/production/targets/canary/simplyprint-client/app/simplyprint-client-1.0.0-rc.4-macos-arm64.tar.gz"
      sha256 "ce4937ed597d43bc4d16313688d60b7d194b0de93b3c926a3cce196a31cee23e"
    end

    on_intel do
      url "https://download.simplyprint.io/client/ota/production/targets/canary/simplyprint-client/app/simplyprint-client-1.0.0-rc.4-macos-x86_64.tar.gz"
      sha256 "a124d2e57299eac14db88c5782d864aa3ffd35373a2c35d957c880b302ed468c"
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
