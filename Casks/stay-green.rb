cask "stay-green" do
  version "0.5.4"
  sha256 "00fd83895bbc0134f7a8fd808e5daf67de635330fab2aa339c63e5d29777575f"

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
