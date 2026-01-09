cask "nfc-agent" do
  version "0.6.5"
  sha256 "4275088acee28e3daed58d289cd6ea8ac63aa8872a7b18af880fcf81af6eda91"

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
