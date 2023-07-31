#!/data/data/com.termux/files/usr/bin/sh
clear
echo "===== dart help pub ====="
dart help pub
echo ">>> cd .. <<<"
cd ..
echo ">>> ls -ahl <<<"
ls -ahl
echo ">>> dart --disable-analytics pub get <<<"
dart --disable-analytics pub get
echo ">>> cd lib <<<"
cd lib
echo ">>> ls -ahl <<<"
ls -ahl
echo ""
echo ""
echo "===== dart help analyze ====="
dart help analyze
echo ">>> dart --disable-analytics analyze ./ <<<"
dart --disable-analytics analyze ./
echo ""
echo ""
echo "===== dart help format ====="
dart help format
echo ">>> dart --disable-analytics format --fix ./ <<<"
dart --disable-analytics format --fix ./
echo ""
echo ""
echo "===== dart help compile ====="
dart help compile
echo ""
echo ">>> dart help compile aot-snapshot <<<"
dart help compile aot-snapshot
echo ">>> dart --disable-analytics compile aot-snapshot --sound-null-safety dart001.dart <<<"
dart --disable-analytics compile aot-snapshot --sound-null-safety dart001.dart
echo ""
echo ""

echo "==== dartaotruntime help -v"
dart help run 
dartaotruntime --version
dartaotruntime --help --verbose
echo ">>> dartaotruntime dart001.aot --snapshot-kind=AOT --observe  >>> http://localhost:8181"
echo "        Enables the VM service
              and listens on the specified port for connections
              (default port number is 8181,
               default bind address is localhost)"
dartaotruntime dart001.aot --snapshot-kind=AOT --observe
