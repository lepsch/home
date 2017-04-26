function uuid
    uuidgen | tr -d '\n' | tee /dev/tty | xclip -i -selection c
end
