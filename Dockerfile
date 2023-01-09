FROM amazoncorretto:17

# NOTE: https://rtyley.github.io/bfg-repo-cleaner/
ENV BFG_VERSION="1.14.0"

RUN yum upgrade -y && \
  yum install -y shadow-utils

ENV HOME /home/bfg
RUN useradd --create-home --home-dir $HOME bfg \
  && chown -R bfg:bfg $HOME

COPY ./entrypoint.sh /home/bfg/
RUN chmod +x /home/bfg/entrypoint.sh

WORKDIR /tmp
RUN curl "https://repo1.maven.org/maven2/com/madgag/bfg/$BFG_VERSION/bfg-$BFG_VERSION.jar" \
  -o "bfg-$BFG_VERSION.jar" \
  && mv "bfg-$BFG_VERSION.jar" /home/bfg/bfg.jar

WORKDIR "$HOME/workspace"
USER bfg
ENTRYPOINT ["/home/bfg/entrypoint.sh", "/home/bfg/bfg.jar"]