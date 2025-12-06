cask "nfc-agent" do
  version "0.1.6"
  sha256 "bb4d1a205ad63eb099a2acc517dde128e3359e8760a0a6babace938ba15ca99f"

  url "https://github.com/SimplyPrint/nfc-agent/releases/download/v#{version}/NFC-Agent-#{version}-macos.dmg"
  name "NFC Agent"
  desc "NFC card reader agent for SimplyPrint"
  homepage "https://github.com/SimplyPrint/nfc-agent"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "NFC Agent.app"

  zap trash: [
    "~/Library/Application Support/NFC Agent",
    "~/Library/Preferences/com.simplyprint.nfc-agent.plist",
    "~/Library/LaunchAgents/com.simplyprint.nfc-agent.plist",
  ]
end
