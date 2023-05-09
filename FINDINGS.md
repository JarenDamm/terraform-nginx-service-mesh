# FINDINGS

# Traffic Management
## Traffic Splitting in Alpha
You can use traffic splitting for most deployment scenarios, including canary, blue-green, A/B testing, and so on. The ability to control traffic flow to different versions of an application makes it easy to roll out a new application version with minimal effort and interruption to production traffic.
```
apiVersion: split.smi-spec.io/v1alpha3
kind: TrafficSplit
metadata:
  name: target
spec:
  service: target-svc
  backends:
  - service: target-v1
    weight: 0
  - service: target-v2
    weight: 1
  - service: target-v3
    weight: 0
  matches:
  - kind: HTTPRouteGroup
    name: target-route-group
---
 apiVersion: specs.smi-spec.io/v1alpha3
 kind: HTTPRouteGroup
 metadata:
   name: target-route-group
   namespace: default
 spec:
   matches:
   - name: metrics
     pathRegex: "/metrics"
     methods:
     - GET
  - name: test-header
    headers:
      x-test: "^true$"
```

## mTLS


# Security Management

# Ingress Included
One exists but is managed seperated and requires unclear configuration for them to interact.
# Fault Tolerance

# UI 
Open source tools like Jaeger, Grafana, Prometheus

# Outgoing Traffic

# Management

# Change Frequency

# Configuration - What setup is needed for services

# Multi-Cluster Capable

# Cool Stuff
