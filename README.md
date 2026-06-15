# SimplyPrint Homebrew Tap

Homebrew formulae and casks for SimplyPrint software.

## Installation

```bash
brew tap simplyprint/tap
brew trust simplyprint/tap
```

## Available Software

### SimplyPrint Client

Links your local printers to SimplyPrint.

> [!IMPORTANT]  
> Many printers reach SimplyPrint on their own. 
> This client — and any extra hardware — is only needed for printers that can't. 
> Only download the client if the setup guide calls for it: https://simplyprint.io/setup-guide

```bash
brew install simplyprint-client
brew services start simplyprint-client
```

Or install in one command (no tap needed):

```bash
brew install simplyprint/tap/simplyprint-client
brew services start simplyprint/tap/simplyprint-client
```

### NFC Agent

NFC card reader agent for SimplyPrint 3D printer management.

```bash
brew install nfc-agent
```

Or install in one command (no tap needed):

```bash
brew install simplyprint/tap/nfc-agent
```

## Updating

```bash
brew update
brew upgrade simplyprint-client
brew upgrade nfc-agent
```

## Uninstalling

```bash
brew services stop simplyprint-client
brew uninstall simplyprint-client
brew uninstall nfc-agent
```
