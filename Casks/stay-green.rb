cask "stay-green" do
  version "1.1.0"
  sha256 "0030fba97d3d7d19fe60ffeb10346bad1e262df281290685a43a6dc9c57463ae"

  url "https://github.com/GetStayGreen/staygreen/releases/download/v#{version}/StayGreen-#{version}.dmg"
  name "Stay Green"
  desc "Keeps chat app presence active while you are idle"
  homepage "https://getstaygreen.com/"

  livecheck do
    url "https://getstaygreen.com/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on macos: :ventura

  app "StayGreen.app"

  uninstall quit: "com.staygreen.app"

  zap trash: [
    "~/Library/Caches/com.staygreen.app",
    "~/Library/Caches/com.staygreen.app.sparkle",
    "~/Library/HTTPStorages/com.staygreen.app",
    "~/Library/Preferences/com.staygreen.app.plist",
  ]
end
