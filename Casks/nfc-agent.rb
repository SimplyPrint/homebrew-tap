cask "nfc-agent" do
  version "0.1.9"
  sha256 "3d98ad2bf71be2f56d49445da0e0a9294f02ce83613d09f357f3045511b4ff65"

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
