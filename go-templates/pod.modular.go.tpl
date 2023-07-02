{{/* define template called labels  */}}
{{- define "labels" -}}
    {{range $label,$value := .metadata.labels}}
        {{$label}}{{" => "}}{{$value -}}
    {{end}}
{{- end -}}

{{/* define template called volumes  */}}
{{- define "volumes" -}}
    {{ range .spec.volumes }}
        - {{.name}}
    {{- end -}}
{{- end -}}
apiVersion: {{.apiVersion}}{{"\n"}}
{{ range .items -}}
    POD: {{ .metadata.name}}
    NODE: {{.spec.nodeName}}
    PHASE: {{.status.phase}}
    VOLUMES: {{template "volumes" .}}
    LABELS: {{template "labels" .}}{{"\n"}}

{{- end -}}
Number of pods: {{ len .items  }} {{"\n"}}