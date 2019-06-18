$tmpdir = "#{Dir.tmpdir}/mitamae"
Dir.mkdir($tmpdir) unless File.exist?($tmpdir)
puts "tempdir: #{$tmpdir}"

$anyenv_cmd = proc do |cmd|
  <<-CMD
    PATH="${HOME}/.anyenv/bin:${PATH}"
    bash -c '
      eval "$(anyenv init -)"
      #{cmd}
    '
  CMD
end

define :download_binary,
  name: nil,
  url: nil,
  check_method: :existence do
  bin_path = "/home/#{$secret.user}/bin/#{params[:name]}"

  not_if = case params[:check_method]
    when :existence
      "[ -x #{bin_path} ]"
    when Hash
      "#{bin_path} #{params[:check_method][:args]} | grep -q '#{params[:check_method][:expected]}'"
    else
      raise "Unknown check method"
  end

  execute "Download #{params[:name]}" do
    command "curl -LSs -o #{bin_path} #{params[:url]}"
    notifies :run, "execute[Make #{params[:name]} executable]", :immediately
    not_if not_if
  end

  execute "Make #{params[:name]} executable" do
    action :nothing
    command "chmod +x #{bin_path}"
  end
end
