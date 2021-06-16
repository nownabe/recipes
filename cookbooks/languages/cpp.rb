execute "Install cpplint" do
  command "/usr/bin/pip install cpplint"
  not_if "/usr/bin/pip list | grep -q cpplint"
end
