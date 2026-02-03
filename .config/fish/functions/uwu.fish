function uwu
    if test (count $argv) -eq 0
        command sudo -s
        return
    end

    set -l first $argv[1]

    if test $first = install
        if test (count $argv) -eq 1
            command sudo pacman -Syu
            return
        end

        set -l rest $argv[2..-1]
        if string match -q -r '^-' $rest[1]
            command sudo pacman $rest
        else
            command sudo pacman -S $rest
        end
        return
    end

    if functions -q $first
        set -l fdef (functions $first)

        if test (count $argv) -gt 1
            set -l rest (__escape_args $argv[2..-1])
            set -l fullcmd "$fdef\n$first $rest"
        else
            set -l fullcmd "$fdef\n$first"
        end

        command sudo fish -c "$fullcmd"
    else
        command sudo $argv
    end
end
