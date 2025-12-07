cask "nfc-agent" do
  version "0.1.7"
  sha256 "055c44ee95702689c83e5061bc51bdaad1f725012801816421b074e912048b38"

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
