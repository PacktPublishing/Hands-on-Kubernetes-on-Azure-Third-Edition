apiVersion: {{.apiVersion}}{{"\n"}}
{{ range .items -}}
    POD: {{ .metadata.name}}
    NODE: {{.spec.nodeName}}
    PHASE: {{.status.phase}}{{"\n"}}
    VOLUMES: {{range .spec.volumes -}}
                {{.name}}{{" "}}
             {{- end -}}
             {{"\n"}}
{{- end -}}
Number of pods: {{ len .items  }} {{"\n"}}