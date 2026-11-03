cask "stay-green" do
  version "1.0.2"
  sha256 "9cd4ecca15c260a6a6f5c026ba13fecb55ba26d26921d4f1ae5439133aabd522"

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
