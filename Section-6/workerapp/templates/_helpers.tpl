{{/* 
Name of the Release
*/}}
{{- define "workerapp.releasename" -}}
{{- printf "%s" .Release.Name | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/* 
Current Release Labels
*/}}
{{- define "workerapp.Labels" -}}
deploy: {{ .Values.workerapp.deploy }}
{{- end }}

{{/* 
Current Release MatchLabels
*/}}
{{- define "workerapp.selectorLabels" -}}
name: {{ .Values.workerapp.name }}
tier: {{ .Values.workerapp.tier }}
{{- end }}