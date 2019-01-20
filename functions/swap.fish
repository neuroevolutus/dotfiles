function swap
    mv $argv[1] $argv[1].backup
    mv $argv[2] $argv[1]
    mv $argv[1].backup $argv[2]
end
