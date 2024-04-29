{{/* 
Name of the Release
*/}}
{{- define "voteapp.releasename" -}}
{{- printf "%s" .Release.Name | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/* 
Current Release Labels
*/}}
{{- define "voteapp.Labels" -}}
deploy: {{ .Values.voteapp.deploy }}
{{- end }}

{{/* 
Current Release MatchLabels
*/}}
{{- define "voteapp.selectorLabels" -}}
name: {{ .Values.voteapp.name }}
tier: {{ .Values.voteapp.tier }}
{{- end }}