{{/* 
Name of the Release
*/}}
{{- define "redisapp.releasename" -}}
{{- printf "%s" .Release.Name | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/* 
Current Release Labels
*/}}
{{- define "redisapp.Labels" -}}
deploy: {{ .Values.redisapp.deploy }}
{{- end }}

{{/* 
Current Release MatchLabels
*/}}
{{- define "redisapp.selectorLabels" -}}
name: {{ .Values.redisapp.name }}
tier: {{ .Values.redisapp.tier }}
{{- end }}