function r --description "recursive cmd"
    set cmd $argv
    for dir in *
        if test -d $dir
            echo $dir
        end
    end | parallel -j8 exec_cmd_in_dir "{} $cmd"
end
