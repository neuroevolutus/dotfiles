function swap
    git mv $argv[1] $argv[1].backup
    git mv $argv[2] $argv[1]
    git mv $argv[1].backup $argv[2]
end
