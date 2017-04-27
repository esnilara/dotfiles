function pllf
  if count $argv -gt 0 > /dev/null
    read -p 'echo "Are you sure you want to pull force changes for $argv branch? (y/n): "' -l confirm
    switch $confirm
      case Y y
        git fetch origin $argv
        git reset --hard origin/$argv
      case '' N n
        return 1
    end
  else
    echo 'This function expects the git branch name as argument.'
  end
end

