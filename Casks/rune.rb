cask "rune" do
  arch arm: "arm64", intel: "amd64"

  version "1.3.2"
  sha256 arm:          "62a0fce5503890efe2fe46e723b8d82e3850c60bdff8f6bf1f72020adc2db3d6",
         intel:        "f0db3795a380838d2ad54ca85dc4be4fa88847864c735e56d43c656ec01dbb28",
         arm64_linux:  "99b35fdf2c5fa2a2924fd6d183255479514cbf99e9b006392a4d4e7e1d35449e",
         x86_64_linux: "b2d06bb396f8eb61cd3654e3727c84933c0ad7a80c8aa9fa92da90ea715a5fff"

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
