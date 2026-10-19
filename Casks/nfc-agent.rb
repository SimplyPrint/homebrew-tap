cask "nfc-agent" do
  version "0.8.0"
  sha256 "68125a7853fcb7aa0e2303796cad4a5998f76acc242cbed843e5715ff5b91d2b"

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
