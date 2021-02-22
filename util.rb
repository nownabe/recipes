# frozen_string_literal: true

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
  bin_path = "#{home}/bin/#{params[:name]}"

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

define :install_tar,
       name: nil,
       url: nil,
       check: :existence do
  bin_path = "#{home}/bin/#{params[:name]}"
  tar_path = File.join($tmpdir, "#{params[:name]}.tar.gz")

  not_if = case params[:check]
    when :existence
      "[ -x #{bin_path} ]"
    when Hash
      "#{bin_path} #{params[:check][:args]} | grep -q '#{params[:check][:expected]}'"
    else
      raise "Unknown check method"
    end

  execute "Download #{params[:name]}" do
    command "curl -LSs -o #{tar_path} #{params[:url]}"
    notifies :run, "execute[Extract #{params[:name]}]", :immediately
    not_if not_if
  end

  execute "Extract #{params[:name]}" do
    action :nothing
    command "tar xf #{tar_path} -C #{home}/bin"
  end
end

define :install_from_repository,
       name: nil,
       repository: nil do
  not_if_word = if params[:repository].start_with?("ppa")
      params[:repository].split(":").last
    else
      params[:repository]
    end

  execute "Add apt repository #{params[:repository]}" do
    user "root"
    command "apt-add-repository -y #{params[:repository]}"
    notifies :run, "execute[Update]", :immediately
    not_if "apt-cache policy | grep -q #{not_if_word}"
  end

  package params[:name] do
    user "root"
  end
end
