{{/* 
Name of the Release
*/}}
{{- define "postgresapp.releasename" -}}
{{- printf "%s" .Release.Name | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/* 
Current Release Labels
*/}}
{{- define "postgresapp.Labels" -}}
deploy: {{ .Values.postgresapp.deploy }}
{{- end }}

{{/* 
Current Release MatchLabels
*/}}
{{- define "postgresapp.selectorLabels" -}}
name: {{ .Values.postgresapp.name }}
tier: {{ .Values.postgresapp.tier }}
{{- end }}

{{- define "postgresapp.envSecrets" -}}
{{- range $key, $val := .Values.env.secret }}
- name: {{ $key }}
  valueFrom:
    secretKeyRef:
      name: db-secret
      key: {{ $key }} 
{{- end }}
{{- end }}