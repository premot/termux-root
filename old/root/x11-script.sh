export TMPDIR=/mnt/media_rw/6d2ff93e-eacd-415c-96d5-4611ad21e05f/tmp
export CLASSPATH=$(/system/bin/pm path com.termux.x11 | cut -d: -f2)
/system/bin/app_process / com.termux.x11.CmdEntryPoint :0
