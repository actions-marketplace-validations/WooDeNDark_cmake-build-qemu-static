# Cmake build with Qemu-static 

Build cmake project on other platforms, different host

## Inputs

## `platform`

**Required** 

Choose platform (e.g. arm32v8). All platforms - https://github.com/docker-library/official-images#architectures-other-than-amd64

## `image`

**Required** 

Choose image (debian or alpine). Please note that not all platforms have the required images. Check all images needed platform - https://hub.docker.com/u/arm32v5 - for example

## `target`

**Required** 

Build needed target


## Example usage
```yaml

uses: WooDenDark/cmake-build-qemu-static
with:
  platform: 'arm32v6'
  image: 'alpine'
  target: 'all'
```