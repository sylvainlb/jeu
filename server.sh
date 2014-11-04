#! /bin/sh
start_server() {
    echo "Starting game..."
    bundle exec clockworkd -c lib/clockwork.rb start
    bundle exec script/delayed_job start
    bundle exec rails s
    echo "."
}
stop_server() {
    echo "Stopping game..."
    bundle exec clockworkd -c lib/clockwork.rb stop
    bundle exec script/delayed_job stop
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
