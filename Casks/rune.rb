cask "rune" do
  arch arm: "arm64", intel: "amd64"

  version "1.3.1"
  sha256 arm:          "ee6c1f7b31a0010fe5105c75678dd5d1c85cf92ec42c80f740de14f8cee05b5c",
         intel:        "8a9dfbab105d34971d20a0656bf0110736bc6757a695d8bd3de859d4ce00e174",
         arm64_linux:  "7613bf8605a7977dbb2c1765b20a7ee4da2194506e7fb9da8ebfff0826938dcd",
         x86_64_linux: "82ec4e1b625d2988edf91a912a509bac8b49044948c79171a2dead41bda57b2b"

  on_macos do
    url "https://github.com/unstablebuild/rune/releases/download/v#{version}/Rune-v#{version}-darwin-#{arch}.dmg"

    depends_on macos: :ventura

    app "Rune.app"
    binary "#{appdir}/Rune.app/Contents/MacOS/rune"

    zap trash: [
      "~/.rune",
      "~/Library/Caches/rune",
      "~/Library/Preferences/dev.rune.plist",
    ]
  end
  on_linux do
    url "https://github.com/unstablebuild/rune/releases/download/v#{version}/rune-v#{version}-linux-#{arch}.tar.gz"

    binary "rune.app/bin/rune"

    zap trash: [
      "~/.cache/rune",
      "~/.rune",
    ]
  end

  name "Rune"
  desc "Fast, GPU-accelerated, full-featured IDE and terminal multiplexer"
  homepage "https://rune.build/"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
end
