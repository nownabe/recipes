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
