FROM golang:1.20.1-alpine AS builder

RUN apk add --no-cache git=2.38.4-r0 build-base=0.5-r3 && \
    rm -rf /var/lib/apt/lists/* 

# jsonnet v0.19.1
RUN git clone https://github.com/google/jsonnet && cd jsonnet && \
  git checkout 813c7412d1c7a42737724d011618d0fd7865bc69 && \
  make

# jsonnet-bundler v0.5.1
# grafonnet-lib master (updated 2022-06-29, last checked 2023-02-24)
RUN go install github.com/jsonnet-bundler/jsonnet-bundler/cmd/jb@451a33c1c1f6950bc3a7d25353e35bed1b983370 && \
    jb init && \
    jb install https://github.com/grafana/grafonnet-lib/grafonnet@ec5e923ba70c74d79d8501257bb98b48cbdd1ee3

# mixtool main (updated 2023-02-18, last checked 2023-02-24)
RUN go install github.com/monitoring-mixins/mixtool/cmd/mixtool@fb5c2176a10f45ba38d861bdbc342de71a92311b

FROM alpine:3.17

RUN apk add --no-cache libstdc++=12.2.1_git20220924-r4 ca-certificates

COPY --from=builder /go/jsonnet/jsonnet /usr/local/bin/
COPY --from=builder /go/jsonnet/jsonnetfmt /usr/local/bin/
COPY --from=builder /go/bin/jb /usr/local/bin/
COPY --from=builder /go/bin/mixtool /usr/local/bin/

WORKDIR /dashboards
COPY --from=builder /go/vendor vendor
ENV JSONNET_PATH=/dashboards/vendor

ENTRYPOINT [ "/bin/sh" ]
