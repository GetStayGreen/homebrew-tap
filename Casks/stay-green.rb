cask "stay-green" do
  version "1.0.3"
  sha256 "56bea97cb77ad715c173baf575bec9166b980ccdf9c54022c02d0f675ec23e43"

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
