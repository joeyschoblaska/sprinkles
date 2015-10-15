### BEGIN INIT INFO
# Provides:          unicorn
# Required-Start:    $remote_fs $syslog
# Required-Stop:     $remote_fs $syslog
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: Start daemon at boot time
# Description:       Enable service provided by daemon.
### END INIT INFO

set -e
 
sig () {
  test -s "$PID" && kill -$1 `cat "$PID"`
}
 
oldsig () {
  test -s "$OLD_PID" && kill -$1 `cat "$OLD_PID"`
}
 
cmd () {
 
  case $1 in
    start)
      sig 0 && echo >&2 "Already running" && exit 0
      echo "Starting"
      cd $APP_ROOT && $CMD
      ;;  
    stop)
      sig QUIT && echo "Stopping" && exit 0
      echo >&2 "Not running"
      ;;  
    force-stop)
      sig TERM && echo "Forcing a stop" && exit 0
      echo >&2 "Not running"
      ;;  
    restart|reload)
      sig USR2 && sleep 5 && oldsig QUIT && echo "Killing old master" `cat $OLD_PID` && exit 0
      echo >&2 "Couldn't reload, starting '$CMD' instead"
      cd $APP_ROOT && $CMD
      ;;  
    upgrade)
      sig USR2 && echo Upgraded && exit 0
      echo >&2 "Couldn't upgrade, starting '$CMD' instead"
      cd $APP_ROOT && $CMD
      ;;  
    rotate)
            sig USR1 && echo rotated logs OK && exit 0
            echo >&2 "Couldn't rotate logs" && exit 1
            ;;  
    *)  
      echo >&2 "Usage: $0 <start|stop|restart|upgrade|rotate|force-stop>"
      exit 1
      ;;  
    esac
}
 
setup () {
  export APP_ROOT="/home/deploy/<%= @app_name %>/current"
  export APP_ENV="production"
  [ -f /etc/environment ] && . /etc/environment
 
  echo -n "$APP_ROOT: "  
  cd $APP_ROOT || exit 1
  export PID=/home/deploy/<%= @app_name %>/shared/pids/unicorn.pid
  export OLD_PID="$PID.oldbin"
 
  CMD="/home/deploy/.rvm/wrappers/default/bundle exec unicorn_rails -c config/unicorn.rb -E $APP_ENV -D"
}
 
start_stop () {
  setup
  cmd $1
}
 
ARGS="$1 $2"
start_stop $ARGS
