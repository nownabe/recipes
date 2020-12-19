# http://mattintosh.hatenablog.com/entry/20160828/1472324980

qaac_version = "2.68"


tmpdir = File.join($tmpdir, "qaac")

itunes_tmp = File.join(tmpdir, "itunes")
itunes_url = "https://www.apple.com/itunes/download/win64"
itunes_path = File.join(itunes_tmp, "iTunes64Setup.exe")

qaac_tmp = File.join(tmpdir, "qaac")
qaac_url = "https://sites.google.com/site/qaacpage/cabinet/qaac_#{qaac_version}.zip"
qaac_zip = File.join(qaac_tmp, "qaac.zip")

app_path = "#{home}/opt/wine/qaac"
directory app_path

# TODO: Refactor
execute "Install dll for qaac" do
  command <<-CMD
    mkdir -p #{itunes_tmp}
    curl -fsSL -o #{itunes_path} #{itunes_url}
    7z e -o#{itunes_tmp} #{itunes_path} AppleApplicationSupport64.msi
    7z e -o#{itunes_tmp} #{itunes_tmp}/AppleApplicationSupport64.msi '*.dll'
    mv #{itunes_tmp}/x64_AppleApplicationSupport_CoreAudioToolbox.dll #{app_path}/CoreAudioToolbox.dll
    mv #{itunes_tmp}/x64_AppleApplicationSupport_CoreFoundation.dll #{app_path}/CoreFoundation.dll
    mv #{itunes_tmp}/x64_AppleApplicationSupport_libdispatch.dll #{app_path}/libdispatch.dll
    mv #{itunes_tmp}/x64_AppleApplicationSupport_objc.dll #{app_path}/objc.dll
    mv #{itunes_tmp}/x64_AppleApplicationSupport_ASL.dll #{app_path}/ASL.dll
    mv #{itunes_tmp}/x64_AppleApplicationSupport_libicuin.dll #{app_path}/libicuin.dll
    mv #{itunes_tmp}/x64_AppleApplicationSupport_libicuuc.dll #{app_path}/libicuuc.dll
    mv #{itunes_tmp}/x64_AppleApplicationSupport_icudt55.dll #{app_path}/icudt55.dll
  CMD
  not_if "[ -f #{app_path}/CoreAudioToolbox.dll ]"
end

execute "Install qaac" do
  command <<-CMD
    mkdir -p #{qaac_tmp}
    curl -fsSL -o #{qaac_zip} #{qaac_url}
    unzip -o -d #{qaac_tmp} #{qaac_zip}
    mv -f #{qaac_tmp}/qaac_#{qaac_version}/x64/* #{app_path}
  CMD
  not_if "WINEDEBUG=fixme-all wine #{app_path}/qaac64.exe --check 2>&1 | grep -q #{qaac_version}"
end

# TODO: Wrapper
