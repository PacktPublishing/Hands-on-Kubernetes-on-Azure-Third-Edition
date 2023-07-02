{{- range .items -}}
    {{ $name := .metadata.name }}
    {{- range .spec.template.spec.containers -}}
        {{$name}} {{": "}} {{ .resources.limits.cpu }} {{"\n"}}
    {{- end -}}
{{- end -}}
