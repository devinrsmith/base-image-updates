group "default" {
    targets = [
        "debian-buster-slim-updated",
        "debian-buster-slim-sentinel"
    ]
}

group "release" {
    targets = [
        "debian-buster-slim-updated-release",
        "debian-buster-slim-sentinel-release"
    ]
}

target "debian-buster-slim-updated" {
    context = "debian/buster-slim/"
    tags = [ "ghcr.io/devinrsmith/debian:buster-slim-updated" ]
    target = "updated"
}

target "debian-buster-slim-sentinel" {
    context = "debian/buster-slim/"
    tags = [ "ghcr.io/devinrsmith/debian:buster-slim-sentinel" ]
    target = "sentinel"
}

target "debian-buster-slim-updated-release" {
    inherits = [ "debian-buster-slim-updated" ]
    cache-from = [ "type=registry,ref=ghcr.io/devinrsmith/debian:buster-slim-updated-cache" ]
    cache-to = [ "type=registry,ref=ghcr.io/devinrsmith/debian:buster-slim-updated-cache,mode=max" ]
    output = [ "type=registry" ]
    platforms = [ "linux/amd64", "linux/arm64" ]
}

target "debian-buster-slim-sentinel-release" {
    inherits = [ "debian-buster-slim-sentinel" ]
    cache-from = [ "type=registry,ref=ghcr.io/devinrsmith/debian:buster-slim-updated-cache" ]
    output = [ "type=registry" ]
    platforms = [ "linux/amd64", "linux/arm64" ]
}
