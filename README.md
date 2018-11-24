# Docker container for building frontend

Docker container having all you need to build your angular cli app on the CI server.

## Building

```
docker pull dxjoke/docker-angular-ci-build
```

## Gitlab CI 
```
image: dxjoke/docker-angular-ci-build
stages:
  - build
  - test
  
before_script:
  - npm install
  
app-build:
  stage: build
  artifacts:
    paths:
      - dist/
  script:
    - npm run build

unit-tests:
  stage: test
  script:
    - npm test
```
