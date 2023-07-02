{{/* filter out unset deployments; m means millicore, 500m=half a cpu */}}
{{- range .items -}}
    {{ $name := .metadata.name }}
    {{- range .spec.template.spec.containers -}}
        {{ $limit := .resources.limits.cpu }}
        {{- if $limit -}}
            {{$name}} {{": "}} {{ $limit }} {{"\n"}} 
        {{- end -}}
    {{- end -}}
{{- end -}}
