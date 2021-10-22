# Docs: https://www.gnu.org/software/coreutils/manual/html_node/ls-invocation.html
alias ll="\
    ls \
    --all \
    --group-directories-first \
    -g \
    -h \
    --classify \
    --color"

# https://linux.m2osw.com/how-remove-ffmpeg-ffprobe-stupid-banner
alias ffmpeg="ffmpeg -hide_banner"
alias ffprobe="ffprobe -hide_banner"
