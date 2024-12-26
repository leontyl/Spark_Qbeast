# Stage 1: Build Java and Scala dependencies
FROM ubuntu:20.04 as build

# Install OpenJDK and Scala
RUN apt-get update && \
    apt-get install -y openjdk-11-jdk scala

# Stage 2: Copy Spark image
FROM bitnami/spark:latest

# Switch to root user to install packages
USER root

# Copy the Java and Scala installation from the build stage
COPY --from=build /usr/lib/jvm/java-11-openjdk-amd64 /usr/lib/jvm/java-11-openjdk-amd64
COPY --from=build /usr/bin/scala /usr/bin/scala
COPY --from=build /usr/share/scala /usr/share/scala

# You can omit the USER 1001 line if unnecessary.
# USER 1001  # If you don't need to switch back to a specific user, you can comment this out.
