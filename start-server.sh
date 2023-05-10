_JAVA_XMX=1G
_JAVA_XMS=1G

if [[ -z "${JAVA_XMX}" ]]; then
  JAVA_XMX=${_JAVA_XMX}
fi

if [[ -z "${JAVA_XMS}" ]]; then
  JAVA_XMS=${_JAVA_XMS}
fi

java \
-Xms${_JAVA_XMS} \
-Xmx${_JAVA_XMX} \
-XX:+UseG1GC \
-XX:+UnlockExperimentalVMOptions \
-XX:MaxGCPauseMillis=100 \
-XX:+DisableExplicitGC \
-XX:TargetSurvivorRatio=90 \
-XX:G1NewSizePercent=50 \
-XX:G1MaxNewSizePercent=80 \
-XX:G1MixedGCLiveThresholdPercent=50 \
-XX:+AlwaysPreTouch \
-jar /jar/paper.jar nogui
