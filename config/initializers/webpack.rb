if Rails.env.development?
  # TODO: add back in once we are using webpack for es6 transpiling
  # webpack_pid = spawn('npm run webpack -- --watch')
  # Process.detach(webpack_pid)
end
