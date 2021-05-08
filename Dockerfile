FROM alpine AS builder
ARG TARGETPLATFORM
ARG BUILDPLATFORM

COPY out .

RUN mv /$TARGETPLATFORM/helloworld /helloworld

FROM ubuntu:focal

LABEL maintainer="Frederic Boltz <frederic.boltz@gmail.com>"

COPY --from=builder /helloworld /usr/local/bin/helloworld
RUN chmod uog+x /usr/local/bin/helloworld

EXPOSE 5200

CMD ["/usr/local/bin/helloworld"]
