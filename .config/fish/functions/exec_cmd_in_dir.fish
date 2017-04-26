function exec_cmd_in_dir
    set dir $argv[1]
    set cmd $argv[2..-1]
    set_color $fish_color_command
    echo -n "./$dir/$cmd[1] "
    set_color $fish_color_param
    echo "$cmd[2..-1]"
    set_color normal
    pushd $dir
    eval $cmd
    popd
end
