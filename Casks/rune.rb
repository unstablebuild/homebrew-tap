cask "rune" do
  arch arm: "arm64", intel: "amd64"

  version "1.2.0"
  sha256 arm:   "abd2ad20f125e77735d21dc99464f3f5dfce6d07065f07a48b410b0ca8cd0d30",
         intel: "1ccd039ecd88c24b8ab4fac5b09b3dc173579ebd08e53ddfc65da9737851e598"

  url "https://github.com/unstablebuild/rune/releases/download/v#{version}/Rune-v#{version}-darwin-#{arch}.dmg"
  name "Rune"
  desc "Fast, GPU-rendered, keyboard-driven IDE"
  homepage "https://rune.build/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  auto_updates true

  app "Rune.app"
  binary "#{appdir}/Rune.app/Contents/MacOS/rune"

  zap trash: "~/.rune"
end
