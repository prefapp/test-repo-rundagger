# Use a base image
FROM alpine:latest as builder

# Define a build argument
ARG REACT_APP_API_URL='testing.local'

RUN echo $REACT_APP_API_URL > /tmp/REACT_APP_API_URL

FROM alpine:latest
COPY --from=builder /tmp/REACT_APP_API_URL /tmp/REACT_APP_API_URL

# Print the build argument in the terminal
ENTRYPOINT ["cat", "/tmp/REACT_APP_API_URL"]
