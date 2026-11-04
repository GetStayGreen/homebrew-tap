cask "stay-green" do
  version "1.0.4"
  sha256 "1304edd1c927b7713b6616e9d7e48f8db9c5ab8cb75c423c11a743e57532437a"

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
