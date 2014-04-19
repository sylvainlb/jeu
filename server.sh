#! /bin/sh
start_server() {
    echo "Starting game..."
    clockworkd -c lib/clockwork.rb start
    script/delayed_job start
    rails s -d
    echo "."
}
stop_server() {
    echo "Stopping game..."
    clockworkd -c lib/clockwork.rb stop
    script/delayed_job stop
    kill -INT $(cat tmp/pids/server.pid)
    rm tmp/pids/server.pid
    echo "."
}
case "$1" in
  "start" )
    start_server
    ;;
  "stop" )
    stop_server
    ;;
  "restart")
    stop_server
    start_server
    ;;
  *)
    echo "Usage: server.sh start|stop|restart"
    exit 1
    ;;
    esac
